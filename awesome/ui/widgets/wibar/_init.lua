-- This file re-export modules

local clockWidget = require("ui.widgets.wibar.clock")
local systrayWidget = require("ui.widgets.wibar.systray")
local volumeWidget = require("ui.widgets.wibar.volume")
local wibarIconWidget = require("ui.widgets.wibar.wibarIcon")
local logoutWidget = require("ui.widgets.wibar.logout")
local layoutBoxWidget = require("ui.widgets.wibar.layoutBox")
local tagListWidget = require("ui.widgets.wibar.tagList")
local taskListWidget = require("ui.widgets.wibar.taskList")

return {
	clock = clockWidget,
	systray = systrayWidget,
	volume = volumeWidget,
	wibarIcon = wibarIconWidget,
	logout = logoutWidget,
	layoutBox = layoutBoxWidget,
	tagList = tagListWidget,
	taskList = taskListWidget,
}
