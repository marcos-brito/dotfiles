local gears = require("gears")
local wibox = require("wibox")
local beautiful = require("beautiful")
local volume_widget = require("../awesome-wm-widgets.volume-widget.volume")

local function createVolumeWidget()
	local volumeWidget = wibox.widget({
		volume_widget({
			device = "default",
			widget_type = "horizontal_bar",
			mute_color = beautiful.bg_urgent,
			main_color = beautiful.greencolor,
		}),
		bg = beautiful.bg_normal,
		shape = beautiful.wibarItemsShape,
		forced_width = 70,
		widget = wibox.container.background,
	})
	return volumeWidget
end

return createVolumeWidget
