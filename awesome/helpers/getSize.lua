local awful = require("awful")

local getSize = {}

function getSize.width(percentage)
	local screenSize = awful.screen.focused().workarea.width

	return screenSize / 100 * percentage
end

function getSize.height(percentage)
	local screenSize = awful.screen.focused().workarea.height

	return screenSize / 100 * percentage
end

return getSize
