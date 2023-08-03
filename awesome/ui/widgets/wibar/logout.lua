local gears = require("gears")
local wibox = require("wibox")
local beautiful = require("beautiful")
local logout_widget = require("../awesome-wm-widgets.logout-popup-widget.logout-popup")

local function createLogoutWidget()
	local logout = wibox.widget({
		logout_widget.widget({}),
		bg = beautiful.bg_normal,
		shape = beautiful.wibarItemsShape,
		widget = wibox.container.background,
	})
	return logout
end

return createLogoutWidget
