local beautiful = require("beautiful")
local gears = require("gears")

local function setWallpaper(s)
	if beautiful.wallpaper then
		local wallpaper = beautiful.wallpaper

		if type(wallpaper) == "function" then
			wallpaper = wallpaper(s)
		end

		gears.wallpaper.maximized(wallpaper, s, true)
	end
end

return setWallpaper
