local wibox = require("wibox")
local beautiful = require("beautiful")
local clock_widget = require("ui.widgets.clock")

local clock = clock_widget(40)

return createFloatingBoxClock
