return {
	"nvim-tree/nvim-tree.lua",
	enable = false,
	opts = {
		sync_root_with_cwd = true,
		respect_buf_cwd = true,
		update_focused_file = {
			enable = true,
			update_cwd = true,
			update_root = false,
		},
		view = {
			relativenumber = true,
			side = "left",
			centralize_selection = false,
		},
		renderer = {

			root_folder_label = false,
		},
	},
}
