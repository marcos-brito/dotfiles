local wibox = require("wibox")
local awful = require("awful")
local beautiful = require("beautiful")
local icon = require("ui.widgets.Icon")

-- local previousIcon = icon("", "playerctl --player=spotify previous", 9, beautiful.purplecolor)
-- local middleIcon = icon("󰎈", "playerctl --player=spotify play-pause", 12, beautiful.purplecolor)
-- local nextIcon = icon("", "playerctl --player=spotify next", 9, beautiful.purplecolor)

local function createPlayer()
	-- local player = wibox.widget({
	-- 	{
	-- 		previousIcon,
	-- 		middleIcon,
	-- 		nextIcon,
	-- 		forced_width = 70,
	-- 		layout = wibox.layout.flex.horizontal,
	-- 	},
	-- 	widget = wibox.container.background,
	-- 	shape = beautiful.wibarItemsShape,
	-- 	bg = beautiful.bg_normal,
	-- })
	-- return player
end

return createPlayer
