return {
	"nvim-telescope/telescope.nvim",
	dependencies = { "nvim-lua/plenary.nvim" },
	opts = function()
		local actions = require("telescope.actions")

		return {
			defaults = {
				layout_config = { height = 0.7, width = 0.6 },
				prompt_prefix = "  ",
				selection_caret = "    ",
				path_display = { "smart" },
				mappings = {
					i = {
						["<C-j>"] = actions.move_selection_next,
						["<C-k>"] = actions.move_selection_previous,
					},
				},
			},
			pickers = {
				find_files = {
					hidden = true,
					-- theme = "dropdown"
				},
				oldfiles = {
					-- theme = "dropdown"
				},
			},
			extensions = {
				file_browser = {
					-- theme = "dropdown"
				},
				projects = {
					-- theme = "dropdown"
				},
			},
		}
	end,
}
