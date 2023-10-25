local gears = require("gears")
local awful = require("awful")
local wibox = require("wibox")
local beautiful = require("beautiful")
local naughty = require("naughty")
local size = require("helpers.getSize")

local text = wibox.widget({
	valign = "center",
	halign = "center",
	text = "hello",
	font = beautiful.font .. "12",
	widget = wibox.widget.textbox,
})

local thing = wibox({
	visible = false,
	homogeneous = true,
	spacing = 5,
	min_cols_size = 6,
	min_rows_size = 10,
	layout = wibox.layout.grid,
	ontop = true,
	bg = "none",
	height = size.height(80),
	width = size.width(80),
	shape = gears.shape.rounded_rect,
})

local profile = wibox.widget({
	{
		text,
		layout = wibox.layout.fixed.horizontal,
	},
	width = size.width(15),
	height = size.height(15),
	bg = beautiful.yellowcolor,
	widget = wibox.container.background,
})

local text = wibox.widget({
	valign = "center",
	halign = "center",
	text = "test",
	font = beautiful.font .. "12",
	widget = wibox.widget.textbox,
})

awful.placement.centered(thing, {
	parent = awful.screen.focused(),
})

local grid = wibox.widget({
	homogeneous = true,
	spacing = 5,
	width = size.width(80),
	height = size.height(80),
	bg = beautiful.yellowcolor,
	layout = wibox.layout.grid,
})

grid:add_widget_at(profile, 5, 5, 10, 6)

thing:setup({
	grid,
	widget = wibox.container.place,
	layout = wibox.layout.fixed.horizontal,
})

return thing
