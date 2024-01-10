-- This file re-export modules

local clockWidget = require("ui.widgets.Wibar.clock")
local systrayWidget = require("ui.widgets.Wibar.systray")
local volumeWidget = require("ui.widgets.Wibar.volume")
local wibarIconWidget = require("ui.widgets.Wibar.wibarIcon")
local layoutBoxWidget = require("ui.widgets.Wibar.layoutBox")
local tagListWidget = require("ui.widgets.Wibar.tagList")
local taskListWidget = require("ui.widgets.Wibar.taskList")
local shutDownWidget = require("ui.widgets.Wibar.shutDown")
local playerWidget = require("ui.widgets.Wibar.player")

return {
	clock = clockWidget,
	systray = systrayWidget,
	volume = volumeWidget,
	wibarIcon = wibarIconWidget,
	layoutBox = layoutBoxWidget,
	tagList = tagListWidget,
	taskList = taskListWidget,
	shutDown = shutDownWidget,
	player = playerWidget,
}
