-- This file re-export modules

local clockWidget = require("ui.widgets.floatingBox.clock")
local dateWidget = require("ui.widgets.floatingBox.date")
local iconWidget = require("ui.widgets.floatingBox.icon")
local playerWidget = require("ui.widgets.floatingBox.player")
local quoteWidget = require("ui.widgets.floatingBox.quote")
local weatherWidget = require("ui.widgets.floatingBox.weather")
local weekDayWidget = require("ui.widgets.floatingBox.weekDay")

return {
	clock = clockWidget,
	date = dateWidget,
	icon = iconWidget,
	player = playerWidget,
	quote = quoteWidget,
	weather = weatherWidget,
	weekDay = weekDayWidget,
}
