local wibox = require("wibox")
local awful = require("awful")
local beautiful = require("beautiful")

local function createIcon(icon, command, size, color)
	local iconWidget = wibox.widget({
		{
			align = "center",
			halign = "center",
			text = icon,
			font = beautiful.font .. size,
			widget = wibox.widget.textbox,
		},
		fg = color,
		widget = wibox.container.background,
	})

	iconWidget:connect_signal("button::press", function()
		awful.spawn.with_shell(command)
	end)

	return iconWidget
end

return createIcon
