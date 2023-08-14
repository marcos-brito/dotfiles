local function getColors()
	local theme = vim.g.colors_name
	local colors = {}
	if theme == "catppuccin" then
		colors["bgligth"] = "#1E1E2E"
		colors["bgdark"] = "#181724"
		colors["textlight"] = "#C9CBFF"
		colors["textdark"] = "#B1B3D8"
		colors["green"] = "#b5e8e0"
		colors["red"] = "#e8a2af"
	end
	if theme == "gruvbox-material" then
		colors["bgligth"] = "#1d2021"
		colors["bgdark"] = "#141618"
		colors["textligth"] = "#8a7a6d"
		colors["textdark"] = "#a4987b"
		colors["green"] = "#98a85a"
		colors["red"] = "#da6260"
	end
	return colors
end

local colors = getColors()

require("cokeline").setup({
	buffers = {
		new_buffers_position = "number",
	},
	rendering = {
		max_buffer_width = 28,
	},
	sidebar = {
		filetype = "NvimTree",
		components = {
			{
				text = "",
				bg = colors.bgligth,
				fg = colors.bgligth,
			},
		},
	},
	default_hl = {
		fg = function(buffer)
			if buffer.is_focused then
				return colors.textligth
			else
				return colors.textdark
			end
		end,
		bg = function(buffer)
			if buffer.is_focused then
				return colors.bgdark
			else
				return colors.bgligth
			end
		end,
	},

	components = {
		{
			text = function(buffer)
				return " " .. buffer.devicon.icon
			end,
			fg = function(buffer)
				return buffer.devicon.color
			end,
		},
		{
			text = function(buffer)
				return buffer.filename .. " "
			end,
			style = function(buffer)
				return buffer.is_focused and "bold" or nil
			end,
			truncation = {
				priority = 10,
			},
		},
		{
			text = function(buffer)
				if buffer.is_modified then
					return " ● "
				elseif buffer.is_readonly then
					return "  "
				else
					return " "
				end
			end,
			fg = function(buffer)
				if buffer.is_focused then
					return colors.green
				else
					return colors.red
				end
			end,
		},
	},
})
