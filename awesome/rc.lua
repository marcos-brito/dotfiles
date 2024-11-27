pcall(require, "luarocks.loader")
require("awful.autofocus")
require("awful.hotkeys_popup.keys")

local awful = require("awful")
local naughty = require("naughty")

local setTheme = require("helpers.setTheme")
local setWallpaper = require("helpers.setWallpaper")
local Wibar = require("ui.Wibar")
local FloatingBox = require("ui.FloatingBox")
local ShutdownMenu = require("ui.ShutdownMenu")
local VolumePopup = require("ui.VolumePopup")

--Check for errors and load default config if any
if awesome.startup_errors then
	naughty.notify({
		preset = naughty.config.presets.critical,
		title = "Oops, there were errors during startup!",
		text = awesome.startup_errors,
	})
end

do
	local in_error = false
	awesome.connect_signal("debug::error", function(err)
		if in_error then
			return
		end
		in_error = true

		naughty.notify({
			preset = naughty.config.presets.critical,
			title = "Oops, an error happened!",
			text = tostring(err),
		})
		in_error = false
	end)
end

setTheme("gruvbox")
setWallpaper() -- It does not receive params, but you can change the function to do so

-- Globals
terminal = "kitty"
editor = "nvim"
editor_cmd = terminal .. " -e " .. editor
modkey = "Mod4"
autorun = true

-- Include config files
require("./config/layouts")
require("./config/menu")
require("./config/mousebinds")
require("./config/keybinds")
require("./config/rules")

-- Include some widgets
WibarWidget = Wibar()
FloatingBoxWidget = FloatingBox()
VolumePopupWidget = VolumePopup()
ShutdownMenuWidget = ShutdownMenu()

-- Define the keys
root.keys(globalkeys)

-- Place the window somewhere (i think)
client.connect_signal("manage", function(c)
	if awesome.startup and not c.size_hints.user_position and not c.size_hints.program_position then
		awful.placement.no_offscreen(c)
	end
end)

-- Autorun
autorunApps = {
	"picom",
	"xset r rate 200 25",
	"xset s off",
	"xremap ~/dotfiles/xremap/remaps.yml",
}
if autorun then
	for app = 1, #autorunApps do
		awful.util.spawn(autorunApps[app])
	end
end
