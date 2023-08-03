local gears = require("gears")
local wibox = require("wibox")
local beautiful = require("beautiful")

local function createSystray()
	local systray = wibox.widget({
		{
			{
				base_size = 20,
				widget = wibox.widget.systray,
			},
			align = "center",
			valign = "center",
			widget = wibox.container.place,
		},
		bg = beautiful.bg_normal,
		forced_width = 70,
		shape = beautiful.wibarItemsShape,
		widget = wibox.container.background,
	})
	return systray
end

return createSystray
