local gears = require("gears")
local awful = require("awful")
local wibox = require("wibox")

local function Item(name, iconPath, onClickCommand)
	local item = wibox.widget({
		{
			image = iconPath,
			resize = false,
			widget = wibox.widget.imagebox,
		},
		{
			text = name,
			font = "Poppins " .. "11 SemiBold",
			widget = wibox.widget.textbox,
		},
		spacing = 15,
		layout = wibox.layout.fixed.vertical,
	})

	item:connect_signal("button::press", function(x, y, button, a)
		if a == 1 then
			onClickCommand()
		end
	end)

	return item
end

return Item
