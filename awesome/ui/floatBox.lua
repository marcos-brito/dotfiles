local gears = require("gears")
local awful = require("awful")
local wibox = require("wibox")
local beautiful = require("beautiful")
local naughty = require("naughty")
local size = require("helpers.getSize")

-- Include widgets
local floatingBox = require("ui.widgets.floatingBox._init")

local FloatBox = wibox({
	visible = false,
	ontop = true,
	bg = beautiful.bg_normal,
	height = size.height(95),
	width = size.width(30),
	shape = gears.shape.rounded_rect,
})
awful.placement.right(FloatBox, {
	margins = {
		top = 45,
		right = 10,
	},
	parent = awful.screen.focused(),
})

-- Add widgets to de floatBox
FloatBox:setup({
	{
		{
			{
				floatingBox.weekDay(),
				floatingBox.clock(),
				floatingBox.date(),
				-- floatingBox.quote(),
				floatingBox.weather(),
				floatingBox.player(),
				{
					floatingBox.icon("", terminal, 50, beautiful.yellowcolor),
					floatingBox.icon("爵", "firefox", 50, beautiful.greencolor),
					floatingBox.icon("", "rofi -show drun", 50, beautiful.yellowcolor),
					spacing = -50,
					layout = wibox.layout.flex.horizontal,
				},
				spacing = 30,
				layout = wibox.layout.fixed.vertical,
			},
			top = 70,
			widget = wibox.container.margin,
		},
		layout = wibox.layout.fixed.vertical,
	},
	layout = wibox.layout.fixed.vertical,
})

return FloatBox
