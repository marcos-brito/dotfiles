#!/bin/sh

THEME=$(cat)

wallpaper=$(echo $THEME | jq -r ".extra.wallpaper")
hyprctl hyprpaper wallpaper "HDMI-A-1, $wallpaper"
