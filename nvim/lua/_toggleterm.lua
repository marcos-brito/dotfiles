local toggleterm = require("toggleterm")

toggleterm.setup({
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
})

local Terminal = require("toggleterm.terminal").Terminal
local lazygit = Terminal:new({ cmd = "lazygit", hidden = true })

function _lazygit_toggle()
	lazygit:toggle()
end

vim.api.nvim_set_keymap("n", "<leader>tg", "<cmd>lua _lazygit_toggle()<CR>", { noremap = true, silent = true })
