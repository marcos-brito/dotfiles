local gears = require("gears")
local wibox = require("wibox")
local beautiful = require("beautiful")
local floatBox = require("ui.floatBox")
local naughty = require("naughty")

local function createWibarIcon()
	local icon = beautiful.wibarIcon
	local wibarIcon = wibox.widget({
		{
			{
				image = icon,
				resize = true,
				widget = wibox.widget.imagebox,
			},
			margins = 5,
			widget = wibox.container.margin,
		},
		bg = beautiful.bg_normal,
		fg = beautiful.wibarIconColor,
		shape = beautiful.wibarItemsShape,
		widget = wibox.container.background,
	})

	wibarIcon:connect_signal("button::press", function(x, y, button, a)
		if a == 1 then
			FloatBox:toggle()
		else
			Thing.visible = not Thing.visible
		end
	end)

	return wibarIcon
end

return createWibarIcon
