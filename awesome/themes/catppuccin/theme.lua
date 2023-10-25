local naughty = require("naughty")
local gears = require("gears")
local beautiful = require("beautiful")
local theme_assets = require("beautiful.theme_assets")
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi

local gfs = require("gears.filesystem")
local themes_path = string.format("%s/.config/awesome/themes/", os.getenv("HOME"))

local theme = {}

theme.wallpaper = themes_path .. "catppuccin/background.png"
theme.wibarIcon = themes_path .. "catppuccin/wibarIcon.png"
theme.shutdownIcon = themes_path .. "catppuccin/shutdownIcon.png"

theme.quote = "In love with Gruvbox"
theme.wibarItemsShape = gears.shape.rounded_bar
theme.font = "Poppins " -- Please DO NOT remove the white space
theme.wibarIconColor = "#89b4fa"
theme.bluecolor = "#89b4fa"
theme.greencolor = "#a6e3a1"
theme.purplecolor = "#cba6f7"
theme.redcolor = "#f38ba8"
theme.yellowcolor = "#f9e2af"

theme.bg_normal = "#181724"
theme.bg_focus = "#89b4fa"
theme.bg_urgent = "#f38ba8"
theme.bg_minimize = "#6e6c7e"
theme.bg_systray = "#181724"
theme.fg_normal = "#ffffff"
theme.fg_focus = "#181724"
theme.fg_urgent = "#ffffff"
theme.fg_minimize = "#6e6c7e"

theme.useless_gap = dpi(10)
theme.border_width = dpi(1)
theme.border_normal = "#1b1d26"
theme.border_focus = "#abe9b3"
theme.border_marked = "#91231c"

theme.tasklist_bg_focus = "#3d4156"
-- There are other variable sets
-- overriding the default one when
-- defined, the sets are:
-- taglist_[bg|fg]_[focus|urgent|occupied|empty|volatile]
-- tasklist_[bg|fg]_[focus|urgent]
-- titlebar_[bg|fg]_[normal|focus]
-- tooltip_[font|opacity|fg_color|bg_color|border_width|border_color]
-- mouse_finder_[color|timeout|animate_timeout|radius|factor]
-- prompt_[fg|bg|fg_cursor|bg_cursor|font]
-- hotkeys_[bg|fg|border_width|border_color|shape|opacity|modifiers_fg|label_bg|label_fg|group_margin|font|description_font]
-- Example:
--theme.taglist_bg_focus = "#ff0000"

-- Generate taglist squares:
local taglist_square_size = dpi(0)
theme.taglist_squares_sel = theme_assets.taglist_squares_sel(taglist_square_size, theme.bg_minimize)
theme.taglist_squares_unsel = theme_assets.taglist_squares_unsel(taglist_square_size, theme.bg_minimize)

-- Variables set for theming notifications:
theme.notification_bg = beautiful.bg_normal
theme.notification_fg = beautiful.fg_normal
theme.notification_width = dpi(400)
theme.notification_shape = gears.shape.rounded_rect
theme.notification_border_width = 0
theme.notification_margin = 20
theme.notification_spacing = 10

naughty.config.defaults.icon_size = dpi(64)
naughty.config.spacing = theme.notification_spacing
naughty.config.defaults.margin = theme.notification_margin
naughty.config.defaults.border_width = theme.notification_border_width

-- Variables set for theming the menu:
-- menu_[bg|fg]_[normal|focus]
-- menu_[border_color|border_width]
theme.menu_submenu_icon = themes_path .. "catppuccin/submenu.png"
theme.menu_height = dpi(15)
theme.menu_width = dpi(100)

-- You can add as many variables as
-- you wish and access them by using
-- beautiful.variable in your rc.lua
--theme.bg_widget = "#cc0000"

-- Define the image to load
theme.titlebar_close_button_normal = themes_path .. "catppuccin/titlebar/close_normal.png"
theme.titlebar_close_button_focus = themes_path .. "catppuccin/titlebar/close_focus.png"

theme.titlebar_minimize_button_normal = themes_path .. "catppuccin/titlebar/minimize_normal.png"
theme.titlebar_minimize_button_focus = themes_path .. "catppuccin/titlebar/minimize_focus.png"

theme.titlebar_ontop_button_normal_inactive = themes_path .. "catppuccin/titlebar/ontop_normal_inactive.png"
theme.titlebar_ontop_button_focus_inactive = themes_path .. "catppuccin/titlebar/ontop_focus_inactive.png"
theme.titlebar_ontop_button_normal_active = themes_path .. "catppuccin/titlebar/ontop_normal_active.png"
theme.titlebar_ontop_button_focus_active = themes_path .. "catppuccin/titlebar/ontop_focus_active.png"

theme.titlebar_sticky_button_normal_inactive = themes_path .. "catppuccin/titlebar/sticky_normal_inactive.png"
theme.titlebar_sticky_button_focus_inactive = themes_path .. "catppuccin/titlebar/sticky_focus_inactive.png"
theme.titlebar_sticky_button_normal_active = themes_path .. "catppuccin/titlebar/sticky_normal_active.png"
theme.titlebar_sticky_button_focus_active = themes_path .. "catppuccin/titlebar/sticky_focus_active.png"

theme.titlebar_floating_button_normal_inactive = themes_path .. "catppuccin/titlebar/floating_normal_inactive.png"
theme.titlebar_floating_button_focus_inactive = themes_path .. "catppuccin/titlebar/floating_focus_inactive.png"
theme.titlebar_floating_button_normal_active = themes_path .. "catppuccin/titlebar/floating_normal_active.png"
theme.titlebar_floating_button_focus_active = themes_path .. "catppuccin/titlebar/floating_focus_active.png"

theme.titlebar_maximized_button_normal_inactive = themes_path .. "catppuccin/titlebar/maximized_normal_inactive.png"
theme.titlebar_maximized_button_focus_inactive = themes_path .. "catppuccin/titlebar/maximized_focus_inactive.png"
theme.titlebar_maximized_button_normal_active = themes_path .. "catppuccin/titlebar/maximized_normal_active.png"
theme.titlebar_maximized_button_focus_active = themes_path .. "catppuccin/titlebar/maximized_focus_active.png"

-- You can use your own layout icons like this:
theme.layout_fairh = themes_path .. "catppuccin/layouts/fairhw.png"
theme.layout_fairv = themes_path .. "catppuccin/layouts/fairvw.png"
theme.layout_floating = themes_path .. "catppuccin/layouts/floatingw.png"
theme.layout_magnifier = themes_path .. "catppuccin/layouts/magnifierw.png"
theme.layout_max = themes_path .. "catppuccin/layouts/maxw.png"
theme.layout_fullscreen = themes_path .. "catppuccin/layouts/fullscreenw.png"
theme.layout_tilebottom = themes_path .. "catppuccin/layouts/tilebottomw.png"
theme.layout_tileleft = themes_path .. "catppuccin/layouts/tileleftw.png"
theme.layout_tile = themes_path .. "catppuccin/layouts/tilew.png"
theme.layout_tiletop = themes_path .. "catppuccin/layouts/tiletopw.png"
theme.layout_spiral = themes_path .. "catppuccin/layouts/spiralw.png"
theme.layout_dwindle = themes_path .. "catppuccin/layouts/dwindlew.png"
theme.layout_cornernw = themes_path .. "catppuccin/layouts/cornernww.png"
theme.layout_cornerne = themes_path .. "catppuccin/layouts/cornernew.png"
theme.layout_cornersw = themes_path .. "catppuccin/layouts/cornersww.png"
theme.layout_cornerse = themes_path .. "catppuccin/layouts/cornersew.png"

-- Generate Awesome icon:
theme.awesome_icon = theme_assets.awesome_icon(theme.menu_height, theme.bg_focus, theme.fg_focus)

-- Define the icon theme for application icons. If not set then the icons
-- from /usr/share/icons and /usr/share/icons/hicolor will be used.
theme.icon_theme = nil

return theme
