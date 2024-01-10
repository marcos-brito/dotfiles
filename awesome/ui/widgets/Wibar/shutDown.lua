local gears = require("gears")
local wibox = require("wibox")
local beautiful = require("beautiful")
local naughty = require("naughty")

local function createWibarIcon()
	local icon = beautiful.shutdownIcon
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
		fg = beautiful.redcolor,
		shape = beautiful.wibarItemsShape,
		widget = wibox.container.background,
	})

	wibarIcon:connect_signal("button::press", function(x, y, button, a)
		ShutdownMenuWidget.visible = not ShutdownMenuWidget.visible
	end)

	return wibarIcon
end

return createWibarIcon
