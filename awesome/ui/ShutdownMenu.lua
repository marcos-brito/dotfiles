local gears = require("gears")
local awful = require("awful")
local wibox = require("wibox")
local beautiful = require("beautiful")
local naughty = require("naughty")
local size = require("helpers.getSize")

local Item = require("ui.widgets.ShutdownMenu.Item")
local ICONS_PATH = string.format("%s/.config/awesome/icons/", os.getenv("HOME"))

local function ShutdownMenu()
	local menu = wibox({
		visible = false,
		ontop = true,
		bg = beautiful.bg_normal,
		height = size.height(20),
		width = size.width(40),
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
				widget = wibox.widget.imagebox,
			},
			{
				text = name,
				font = beautiful.font .. "11 SemiBold",
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

	local shutDown = Item("", ICONS_PATH .. "shutDown.png", shutDownCommand)
	local suspend = Item("", ICONS_PATH .. "suspend.png", suspendCommand)
	local reboot = Item("", ICONS_PATH .. "reboot.png", rebootCommand)
	local logout = Item("", ICONS_PATH .. "logout.png", logoutCommand)

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
end

return ShutdownMenu
