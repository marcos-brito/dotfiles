local gears = require("gears")
local wibox = require("wibox")
local awful = require("awful")
local beautiful = require("beautiful")

local function createLayoutBox(s)
	s.mylayoutbox = awful.widget.layoutbox(s)

	local layoutBox = wibox.widget({
		{
			{
				s.mylayoutbox,
				layout = wibox.layout.fixed.horizontal,
			},
			margins = 8, -- This will change the icon size
			widget = wibox.container.margin,
		},
		bg = beautiful.bg_normal, -- Comment this line to remove the background
		shape = beautiful.wibarItemsShape,
		widget = wibox.container.background,
	})

	s.mylayoutbox:buttons(gears.table.join(
		awful.button({}, 1, function()
			awful.layout.inc(1)
		end),
		awful.button({}, 3, function()
			awful.layout.inc(-1)
		end),
		awful.button({}, 4, function()
			awful.layout.inc(1)
		end),
		awful.button({}, 5, function()
			awful.layout.inc(-1)
		end)
	))

	return layoutBox
end

return createLayoutBox
