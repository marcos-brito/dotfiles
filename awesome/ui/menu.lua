local gears = require("gears")
local awful = require("awful")
local wibox = require("wibox")
local beautiful = require("beautiful")
local naughty = require("naughty")
local size = require("helpers.getSize")

local menu = wibox({
	visible = false,
	ontop = true,
	bg = beautiful.bg_normal,
	height = size.height(25),
	width = size.width(75),
	shape = gears.shape.rounded_rect,
})

awful.placement.centered(menu, {
	parent = awful.screen.focused(),
})

local function createMenuItem(name, iconPath, onClickCommand)
	local item = wibox.widget({
		{
			image = iconPath,
			resize = false,
			valign = "center",
			halign = "center",
			widget = wibox.widget.imagebox,
		},
		{
			text = name,
			font = beautiful.font .. "11 bold",
			valign = "center",
			halign = "center",
			widget = wibox.widget.textbox,
		},
		spacing = 15,
		layout = wibox.layout.fixed.vertical,
	})
	item:connect_signal("button::press", function(x, y, button, a)
		if a == 1 then
			onClickCommand()
			naughty.notification({
				title = "Achtung!",
				message = "You're idling",
				timeout = 0,
			})
		end
	end)
	return item
end

local icons_path = string.format("%s/.config/awesome/icons/", os.getenv("HOME"))

local shutDownCommand = function()
	awful.spawn.with_shell("shutdown now")
end
local suspendCommand = function()
	awful.spawn.with_shell("systemctl suspend")
end
local rebootCommand = function()
	awful.spawn.with_shell("reboot")
end
local logoutCommand = function()
	awesome.quit()
end

local shutDown = createMenuItem("Shutdown", icons_path .. "shutDown.png", shutDownCommand)
local suspend = createMenuItem("Suspend", icons_path .. "suspend.png", suspendCommand)
local reboot = createMenuItem("Reboot", icons_path .. "reboot.png", rebootCommand)
local logout = createMenuItem("Logout", icons_path .. "logout.png", logoutCommand)

menu:setup({
	{
		logout,
		suspend,
		reboot,
		shutDown,
		spacing = 55,
		layout = wibox.layout.fixed.horizontal,
	},
	valign = "center",
	halign = "center",
	widget = wibox.container.place,
})

return menu
