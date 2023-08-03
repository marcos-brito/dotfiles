local gears = require("gears")
local awful = require("awful")
local wibox = require("wibox")
local beautiful = require("beautiful")
local naughty = require("naughty")
local size = require("helpers.getSize")

local function textBox(content, fontSize)
	local text = wibox.widget({
		valign = "center",
		halign = "center",
		text = content,
		font = beautiful.font .. fontSize,
		widget = wibox.widget.textbox,
	})
	return text
end

local volumeText = textBox("", 12)

local volume = wibox({
	visible = false,
	ontop = true,
	bg = beautiful.bg_normal,
	height = size.height(9),
	width = size.height(12),
	shape = gears.shape.rounded_rect,
})

awful.placement.top_right(volume, {
	margins = {
		top = size.height(50) - size.height(18),
		right = size.width(5),
	},
	parent = awful.screen.focused(),
})

volume:setup({
	{
		{
			{
				textBox("󰋋 ", 20),
				widget = wibox.container.background,
				fg = beautiful.bg_focus,
			},
			{
				awful.widget.watch("amixer sget 'Master'", 0.1, function(widget, stdout)
					local volume_level = string.match(stdout, "(%d?%d?%d)%%")
					local mute = string.match(stdout, "%[(o%D%D?)%]")
					if mute == "off" then
						widget:set_text("")
						return
					end
					widget:set_text(volume_level)
				end, volumeText),
				widget = wibox.container.background,
				fg = beautiful.fg_normal,
			},
			spacing = 5,
			layout = wibox.layout.fixed.horizontal,
		},
		widget = wibox.container.margin,
		margins = 12,
	},
	widget = wibox.container.place,
	layout = wibox.layout.fixed.horizontal,
})

volume.time = 0

function volume:decrease()
	self:toggle()
	awful.spawn.with_shell("amixer sset 'Master' 5%-")
end

function volume:increase()
	self:toggle()
	awful.spawn.with_shell("amixer sset 'Master' 5%+")
end

function volume:mute()
	self:toggle()
	awful.spawn.with_shell("amixer sset 'Master' toggle")
end

function volume:toggle()
	if self.visible == false then
		self.visible = true
		awful.spawn.easy_async_with_shell("sleep 3", function()
			self.visible = false
		end)
	end
end

return volume
