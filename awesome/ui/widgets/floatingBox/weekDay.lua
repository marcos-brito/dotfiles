local wibox = require("wibox")
local beautiful = require("beautiful")

local function createWeekDay()
	local weekDay = wibox.widget({
		{
			format = " %A ",
			align = "center",
			halign = "center",
			font = beautiful.font .. "SemiBold 12",
			widget = wibox.widget.textclock,
		},
		fg = beautiful.yellowcolor,
		widget = wibox.container.background,
	})
	return weekDay
end

return createWeekDay
