local awful = require("awful")
local wibox = require("wibox")

-- Include widgets
local wibar = require("ui.widgets.wibar._init")

-- Create wibar for each screen
awful.screen.connect_for_each_screen(function(s)
	-- Create the wibox
	s.mywibox = awful.wibar({
		position = "top",
		screen = s,
		height = 33,
		bg = "none",
		border_width = 5,
	})
	-- Add widgets to the wibox
	s.mywibox:setup({
		layout = wibox.layout.align.horizontal,
		expand = "none",
		{
			-- Left widgets
			layout = wibox.layout.fixed.horizontal,
			spacing = 4,
			wibar.wibarIcon(),
			wibar.tagList(s),
			wibar.layoutBox(s),
		},
		wibar.taskList(s), -- Middle widget
		{
			-- Right widgets
			layout = wibox.layout.fixed.horizontal,
			spacing = 4,
			wibar.systray(),
			wibar.clock(),
			wibar.volume(),
			wibar.logout(),
		},
	})
end)
