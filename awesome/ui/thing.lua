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
	ontop = true,
	-- bg = "none",
	height = size.height(80),
	width = size.width(80),
	shape = gears.shape.rounded_rect,
})

awful.placement.centered(thing, {
	parent = awful.screen.focused(),
})

local grid = wibox.widget({
	homogeneous = true,
	spacing = 5,
	min_cols_size = 6,
	min_rows_size = 10,
	layout = wibox.layout.grid,
})

thing:setup({
	grid,
})

return thing
