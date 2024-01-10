local dateWidget = require("ui.widgets.floatingBox.date")
local playerWidget = require("ui.widgets.floatingBox.player")
local quoteWidget = require("ui.widgets.floatingBox.quote")
local weatherWidget = require("ui.widgets.floatingBox.weather")
local weekDayWidget = require("ui.widgets.floatingBox.weekDay")

return {
	date = dateWidget,
	player = playerWidget,
	quote = quoteWidget,
	weather = weatherWidget,
	weekDay = weekDayWidget,
}
