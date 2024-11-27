local awful = require("awful")
local wibox = require("wibox")
require("awful.autofocus")
require("awful.hotkeys_popup.keys")

-- Include widgets
local wibar = require("ui.widgets.Wibar._init")

local function Wibar()
	-- Create wibar for each screen
	awful.screen.connect_for_each_screen(function(s)
		-- Create the wibox
		s.mywibox = awful.wibar({
			position = "top",
			screen = s,
			height = 33,
			bg = "none",
			border_width = 10,
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
				-- wibar.player(),
				wibar.volume(),
				wibar.shutDown(),
			},
		})
	end)
end

return Wibar
