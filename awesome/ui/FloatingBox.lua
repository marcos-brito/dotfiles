local gears = require("gears")
local awful = require("awful")
local wibox = require("wibox")
local beautiful = require("beautiful")
local naughty = require("naughty")
local size = require("helpers.getSize")

-- Include widgets
local floating_box_widgets = require("ui.widgets.floatingBox._init")
local Clock = require("ui.widgets.Clock")
local Icon = require("ui.widgets.Icon")

local function FloatingB()
	local FloatingBox = wibox({
		visible = false,
		ontop = true,
		bg = beautiful.bg_normal,
		height = size.height(95),
		width = size.width(30),
		shape = gears.shape.rounded_rect,
	})

	awful.placement.right(FloatingBox, {
		margins = {
			top = 45,
			right = 10,
		},
		parent = awful.screen.focused(),
	})

	-- Add widgets to de floatBox
	FloatingBox:setup({
		{
			{
				{
					floating_box_widgets.weekDay(),
					Clock("", 40),
					floating_box_widgets.date(),
					-- floatingBox.quote(),
					floating_box_widgets.weather(),
					floating_box_widgets.player(),
					{
						Icon("", terminal, 30, beautiful.yellowcolor),
						Icon("", "firefox", 30, beautiful.greencolor),
						Icon("", "rofi -show drun", 30, beautiful.yellowcolor),
						spacing = -50,
						layout = wibox.layout.flex.horizontal,
					},
					spacing = 30,
					layout = wibox.layout.fixed.vertical,
				},
				top = 70,
				widget = wibox.container.margin,
			},
			layout = wibox.layout.fixed.vertical,
		},
		layout = wibox.layout.fixed.vertical,
	})

	function FloatingBox:toggle()
		self.visible = not self.visible
	end

	return FloatingBox
end

return FloatingB
