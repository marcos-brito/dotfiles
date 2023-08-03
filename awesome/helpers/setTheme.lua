local beautiful = require("beautiful")

local function setTheme(name)
	local theme_path = string.format("%s/.config/awesome/themes/%s/theme.lua", os.getenv("HOME"), name)
	beautiful.init(theme_path)
end

return setTheme
