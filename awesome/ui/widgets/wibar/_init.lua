-- This file re-export modules

local clockWidget = require("ui.widgets.wibar.clock")
local systrayWidget = require("ui.widgets.wibar.systray")
local volumeWidget = require("ui.widgets.wibar.volume")
local wibarIconWidget = require("ui.widgets.wibar.wibarIcon")
local layoutBoxWidget = require("ui.widgets.wibar.layoutBox")
local tagListWidget = require("ui.widgets.wibar.tagList")
local taskListWidget = require("ui.widgets.wibar.taskList")
local shutDownWidget = require("ui.widgets.wibar.shutDown")

return {
	clock = clockWidget,
	systray = systrayWidget,
	volume = volumeWidget,
	wibarIcon = wibarIconWidget,
	layoutBox = layoutBoxWidget,
	tagList = tagListWidget,
	taskList = taskListWidget,
	shutDown = shutDownWidget,
}
