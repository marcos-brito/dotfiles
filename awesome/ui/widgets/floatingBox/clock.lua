local wibox = require("wibox")
local beautiful = require("beautiful")

local function createFloatingBoxClock()
	local clock = wibox.widget({
		{
			format = " %H:%M ",
			align = "center",
			halign = "center",
			font = beautiful.font .. "40",
			widget = wibox.widget.textclock,
		},
		widget = wibox.container.background,
	})

	return clock
end

return createFloatingBoxClock
