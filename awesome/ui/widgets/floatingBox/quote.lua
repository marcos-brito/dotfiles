local wibox = require("wibox")
local beautiful = require("beautiful")

local function createQuote()
	local quote = wibox.widget({
		{
			align = "center",
			halign = "center",
			text = beautiful.quote,
			font = beautiful.font .. "12",
			widget = wibox.widget.textbox,
		},
		fg = beautiful.fg_normal,
		widget = wibox.container.background,
	})
	return quote
end

return createQuote
