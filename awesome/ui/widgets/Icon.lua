local wibox = require("wibox")
local awful = require("awful")
local beautiful = require("beautiful")

--- @param icon string
--- @param command string
--- @param size number
--- @param color string
local function createIcon(icon, command, size, color)
	local iconWidget = wibox.widget({
		{
			align = "center",
			halign = "center",
			text = icon,
			font = "Poppins " .. size,
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
