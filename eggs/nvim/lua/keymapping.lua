local opts = { noremap = false, silent = true }
local keymap = vim.api.nvim_set_keymap

vim.g.mapleader = " "
vim.g.maplocalleader = " "

keymap("", "<Space>", "<Nop>", opts)

keymap("n", "<leader>F", ":lua vim.lsp.buf.format()<CR>", opts)

-- Lspsaga
keymap("n", "gd", ":Lspsaga goto_definition<CR>", opts)
keymap("n", "K", ":Lspsaga hover_doc<cr>", opts)
keymap("n", "<leader>a", ":Lspsaga code_action<CR>", opts)
keymap("n", "<leader>r", ":Lspsaga rename<CR>", opts)

-- Outline
keymap("n", "<leader>o", ":Outline <CR>", opts)

-- Harpoon
keymap("n", "<leader>u", ":lua require('harpoon'):list():add()<CR>", opts)
keymap("n", "<C-p>", ":lua require('harpoon').ui:toggle_quick_menu(require('harpoon'):list())<CR>", opts)
keymap("n", "<C-j>", ":lua require('harpoon'):list():select(1)<CR>", opts)
keymap("n", "<C-k>", ":lua require('harpoon'):list():select(2)<CR>", opts)
keymap("n", "<C-l>", ":lua require('harpoon'):list():select(3)<CR>", opts)
-- C-ç does not work but i remapped it to C-h on my machine
keymap("n", "<C-h>", ":lua require('harpoon'):list():select(4)<CR>", opts)

-- Telescope
keymap("n", "<leader>f", ":Telescope find_files <CR>", opts)
keymap("n", "<leader>b", ":Telescope buffers <CR>", opts)
keymap("n", "<leader>g", ":Telescope live_grep <CR>", opts)
keymap("n", "<leader>m", ":Telescope man_pages sections=1,2,3 <CR>", opts)
keymap("n", "<leader>d", ":Telescope diagnostics <CR>", opts)
keymap("n", "<leader>l", ":Telescope lsp_references <CR>", opts)

-- Save
keymap("n", "<leader>s", ":wa<CR>", opts)

-- Stay indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Clear highlights
keymap("n", "<leader>h", "<cmd>nohlsearch<CR>", opts)

-- Oil
keymap("n", "<leader>q", ":Oil<CR>", opts)

-- Neotest
keymap("n", "<leader>t", ":lua require('neotest').summary.toggle() <CR>", opts)
keymap("n", "<leader>T", ":lua require('neotest').run.run() <CR>", opts)

-- Copilot
keymap("n", "<leader-c>", ":Copilot toggle <CR>", opts)
