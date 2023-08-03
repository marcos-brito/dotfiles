local gears = require("gears")
local wibox = require("wibox")
local beautiful = require("beautiful")
local awful = require("awful")

local tagListButtons = gears.table.join(
	awful.button({}, 1, function(t)
		t:view_only()
	end),
	awful.button({ modkey }, 1, function(t)
		if client.focus then
			client.focus:move_to_tag(t)
		end
	end),
	awful.button({}, 3, awful.tag.viewtoggle),
	awful.button({ modkey }, 3, function(t)
		if client.focus then
			client.focus:toggle_tag(t)
		end
	end),
	awful.button({}, 4, function(t)
		awful.tag.viewnext(t.screen)
	end),
	awful.button({}, 5, function(t)
		awful.tag.viewprev(t.screen)
	end)
)

local function createTagList(s)
	awful.tag({ "  1  ", "  2  ", "  3  ", "  4  ", "  5  " }, s, awful.layout.layouts[2])

	s.mytaglist = awful.widget.taglist({
		screen = s,
		filter = awful.widget.taglist.filter.all,
		buttons = tagListButtons,
		style = {
			spacing = 1,
			font = beautiful.font .. "SemiBold 9",
			shape = beautiful.wibarItemsShape,
		},
	})

	local tagList = wibox.widget({
		{
			{
				s.mytaglist,
				layout = wibox.layout.fixed.horizontal,
			},
			margins = 3,
			widget = wibox.container.margin,
		},
		bg = beautiful.bg_normal,
		shape = beautiful.wibarItemsShape,
		widget = wibox.container.background,
	})
	return tagList
end

return createTagList
