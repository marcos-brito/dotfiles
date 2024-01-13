return {
	"akinsho/toggleterm.nvim",
	opts = {
		size = 8,
		open_mapping = [[<c-t>]],
		hide_numbrs = true,
		shade_terminals = true,
		shading_factor = 2,
		start_in_insert = true,
		insert_mappings = true,
		persist_size = true,
		direction = "float",
		close_on_exit = true,
		shell = vim.o.shell,
		float_opts = {
			border = "curved",
			width = 90,
			height = 20,
		},
		highlights = {
			Normal = {
				guibg = "#181b1c",
			},
			NormalFloat = {
				guibg = "#181b1c",
			},
			FloatBorder = {
				guifg = "#181b1c",
				guibg = "#181b1c",
			},
		},
	},
}
