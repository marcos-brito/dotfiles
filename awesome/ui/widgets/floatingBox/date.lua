local wibox = require("wibox")
local beautiful = require("beautiful")

local function createDate()
	local date = wibox.widget({
		{
			format = " %d/%m/%Y",
			align = "center",
			halign = "center",
			font = beautiful.font .. "SemiBold 12",
			widget = wibox.widget.textclock,
		},
		fg = beautiful.greencolor,
		widget = wibox.container.background,
	})

	return date
end

return createDate
