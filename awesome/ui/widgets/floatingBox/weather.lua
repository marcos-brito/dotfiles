local wibox = require("wibox")
local beautiful = require("beautiful")
local awful = require("awful")
local naughty = require("naughty")

local temperature = wibox.widget({
    align = "center",
    halign = "center",
    text = "",
    font = beautiful.font .. "Bold 12",
    fg = beautiful.fg_normal,
    widget = wibox.widget.textbox,
})
local descriiption = wibox.widget({
    align = "center",
    halign = "center",
    text = "",
    font = beautiful.font .. "12",
    fg = beautiful.fg_normal,
    widget = wibox.widget.textbox,
})

local function split(str)
    local splited = {}
    local index = 0
    for i in string.gmatch(str, "%S+") do
        splited[index] = i
        index = index + 1
    end
    return splited
end

local function createWeatherWidget()
    local scriptPath = string.format("%s/.config/awesome/helpers/get_weather.py", os.getenv("HOME"))
    local weather = wibox.widget({
        {
            {
                align = "center",
                halign = "center",
                text = "",
                font = beautiful.font .. "46",
                widget = wibox.widget.textbox,
            },
            fg = beautiful.bluecolor,
            widget = wibox.container.background,
        },
        {
            {
                awful.widget.watch(scriptPath, 160, function(widget, stdout)
                    widget:set_text(split(stdout)[1])
                end, temperature),
                layout = wibox.layout.flex.vertical,
            },
            {
                awful.widget.watch(scriptPath, 160, function(widget, stdout)
                    widget:set_text(split(stdout)[0] .. " °C")
                end, descriiption),
                layout = wibox.layout.flex.vertical,
            },
            layout = wibox.layout.flex.vertical,
            spacing = -12,
            widget = wibox.container.background,
        },
        widget = wibox.container.background,
        spacing = -250,
        layout = wibox.layout.flex.horizontal,
    })
    return weather
end

return createWeatherWidget
