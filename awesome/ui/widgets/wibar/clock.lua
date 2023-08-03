local gears = require("gears")
local wibox = require("wibox")
local beautiful = require("beautiful")

local function createWibarClock()
	local wibarClock = wibox.widget({
		{
			format = " %H:%M ",
			align = "center",
			halign = "center",
			font = beautiful.font .. "SemiBold 9",
			widget = wibox.widget.textclock,
		},
		bg = beautiful.bg_normal,
		fg = beautiful.yellowcolor,
		forced_width = 70,
		shape = beautiful.wibarItemsShape,
		widget = wibox.container.background,
	})

	-- Calendar
	local calendar = require("../awesome-wm-widgets.calendar-widget.calendar")
	local cw = calendar({
		theme = "naughty",
		placement = "top_right",
		start_sunday = true,
		radius = 8,
		previous_month_button = 1,
		next_month_button = 3,
	})

	wibarClock:connect_signal("button::press", function(_, _, _, button)
		if button == 1 then
			cw.toggle()
		end
	end)

	return wibarClock
end

return createWibarClock
