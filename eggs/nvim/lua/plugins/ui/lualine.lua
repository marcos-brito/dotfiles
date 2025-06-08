return {
	"nvim-lualine/lualine.nvim",
	opts = {
		options = {
			globalstatus = true,
			section_separators = { left = "", right = "" },
			component_separators = { left = "", right = "" },
		},
		sections = {
			lualine_a = { "mode" },
			lualine_b = { "filename" },
			lualine_c = { "branch" },
			lualine_y = { "progress" },
			lualine_z = { "location" },
			lualine_x = {
				{
					require("noice").api.status.mode.get,
					cond = require("noice").api.status.mode.has,
				},
			},
		},
	},
}
