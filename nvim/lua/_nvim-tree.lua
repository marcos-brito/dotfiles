local nvim_tree = require("nvim-tree")

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

nvim_tree.setup({
	sync_root_with_cwd = true,
	respect_buf_cwd = true,
	update_focused_file = {
		enable = true,
		update_cwd = true,
		update_root = false,
	},
	view = {
		side = "left",
		hide_root_folder = true,
		centralize_selection = false,
	},
	renderer = {},
})
