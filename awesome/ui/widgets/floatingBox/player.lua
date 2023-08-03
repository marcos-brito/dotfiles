local wibox = require("wibox")
local awful = require("awful")
local beautiful = require("beautiful")
local icon = require("ui.widgets.floatingBox.icon")

local title = wibox.widget({
	align = "center",
	halign = "center",
	text = "",
	font = "Poppins SemiBold 12",
	widget = wibox.widget.textbox,
})
local artist = wibox.widget({
	align = "center",
	halign = "center",
	text = "",
	font = "Poppins SemiBold 9",
	widget = wibox.widget.textbox,
})

local previousIcon = icon("", "playerctl previous", 14, beautiful.redcolor)
local middleIcon = icon("󰎈", "playerctl play-pause", 20, beautiful.redcolor)
local nextIcon = icon("", "playerctl next", 14, beautiful.redcolor)

local function createPlayer()
	local player = wibox.widget({
		{
			{
				previousIcon,
				middleIcon,
				nextIcon,
				forced_width = 100,
				layout = wibox.layout.flex.horizontal,
			},
			widget = wibox.container.place,
		},
		{
			{
				awful.widget.watch("playerctl metadata --format '{{title}}' ", 2, function(widget, stdout)
					widget:set_text(stdout)
				end, title),
				layout = wibox.layout.fixed.vertical,
			},
			{
				awful.widget.watch("playerctl metadata --format '{{artist}}' ", 2, function(widget, stdout)
					widget:set_text(stdout)
				end, artist),
				layout = wibox.layout.fixed.vertical,
			},
			layout = wibox.layout.fixed.vertical,
		},
		spacing = 15,
		widget = wibox.container.background,
		layout = wibox.layout.fixed.vertical,
	})
	return player
end

return createPlayer
