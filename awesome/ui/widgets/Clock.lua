local wibox = require("wibox")
local beautiful = require("beautiful")

local function Clock(weight, size)
	local clock = wibox.widget({
		format = " %H:%M ",
		align = "center",
		halign = "center",
		font = "Poppins " .. weight .. " " .. size,
		widget = wibox.widget.textclock,
	})
	return clock
end

return Clock
