local telescope = require("telescope")
local actions = require("telescope.actions")

telescope.setup({
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
})

telescope.load_extension("workspaces")
telescope.load_extension("file_browser")
