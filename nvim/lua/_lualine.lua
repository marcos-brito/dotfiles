local lualine = require("lualine")

lualine.setup({
	options = {
		globalstatus = true,
		section_separators = { left = "", right = "" },
		component_separators = { left = "", right = "" },
	},
	sections = {
		lualine_a = { "mode" },
		lualine_b = { "filename" },
		lualine_c = { "" },
		lualine_x = { "" },
		lualine_y = { "progress" },
		lualine_z = { "location" },
	},
})
