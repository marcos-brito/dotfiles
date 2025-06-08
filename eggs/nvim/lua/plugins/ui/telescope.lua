return {
	"nvim-telescope/telescope.nvim",
	dependencies = { "nvim-lua/plenary.nvim" },
	opts = {
		defaults = {
			prompt_prefix = "  ",
			selection_caret = "    ",
			path_display = { "smart" },
			mappings = {
				i = {
					["<C-j>"] = "move_selection_next",
					["<C-k>"] = "move_selection_previous",
				},
			},
		},
	},
}
