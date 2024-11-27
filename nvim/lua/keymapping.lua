local opts = { noremap = false, silent = true }
local term_opts = { silent = true }
local keymap = vim.api.nvim_set_keymap

keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Copy from system clipboard
keymap("n", '"p', '"+p', opts)

-- LSP
keymap("n", "gf", ":Lspsaga finder<CR>", opts)
keymap("n", "gd", ":Lspsaga goto_definition<CR>", opts)
keymap("n", "K", ":Lspsaga hover_doc<cr>", opts)
keymap("n", "<leader>ca", ":Lspsaga code_action<CR>", opts)
keymap("n", "<leader>rn", ":Lspsaga rename<CR>", opts)

-- Aerial
keymap("n", "<leader>o", ":AerialToggle!<CR>", opts)

-- Harpoon
keymap("n", "<leader>u", ":lua require('harpoon'):list():add()<CR>", opts)
keymap("n", "<C-p>", ":lua require('harpoon').ui:toggle_quick_menu(require('harpoon'):list())<CR>", opts)
keymap("n", "<C-j>", ":lua require('harpoon'):list():select(1)<CR>", opts)
keymap("n", "<C-k>", ":lua require('harpoon'):list():select(2)<CR>", opts)
keymap("n", "<C-l>", ":lua require('harpoon'):list():select(3)<CR>", opts)
-- C-ç does not work but i remapped it to C-h on my machine
keymap("n", "<C-h>", ":lua require('harpoon'):list():select(4)<CR>", opts)

-- Resize with arrows
keymap("n", "<A-Up>", ":resize -2<CR>", opts)
keymap("n", "<A-Down>", ":resize +2<CR>", opts)
keymap("n", "<A-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<A-Right>", ":vertical resize +2<CR>", opts)

-- Telescope
keymap("n", "<leader>f", ":Telescope find_files <CR>", opts)
keymap("n", "<leader>b", ":Telescope buffers <CR>", opts)
keymap("n", "<leader>g", ":Telescope live_grep <CR>", opts)
keymap("n", "<leader>m", ":Telescope man_pages sections=1,2,3 <CR>", opts)

-- Execute SQL
keymap("n", "<F6>", ":SqlsExecuteQuery<CR>", opts)
keymap("v", "<F6>", ":SqlsExecuteQuery<CR>", opts)

-- Save
keymap("n", "<leader>s", ":w<CR>", opts)
keymap("n", "<leader>as", ":wa<CR>", opts)

-- Stay indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Exit terminal mode with Esc
keymap("t", "<Esc>", "<C-\\><C-N>", term_opts)

-- Better window navigation
-- keymap("n", "<C-h>", "<C-w>h", opts)
-- keymap("n", "<C-j>", "<C-w>j", opts)
-- keymap("n", "<C-k>", "<C-w>k", opts)
-- keymap("n", "<C-l>", "<C-w>l", opts)

-- Clear highlights
keymap("n", "<leader>h", "<cmd>nohlsearch<CR>", opts)

--Markdown Preview
keymap("n", "<leader>p>", ":MarkdownPreviewToggle<CR>", opts)

--Nvim-Tree/Oil
keymap("n", "<leader>q", ":Oil<CR>", opts)
-- keymap("n", "<leader>q", ":NvimTreeToggle<CR>", opts)

-- Rest-nvim
keymap("n", "<leader>w", "<Plug>RestNvim<CR>", opts)
keymap("n", "<leader>wl", "<Plug>RestNvimLast<CR>", opts)

-- Neotest
keymap("n", "<leader>t", ":lua require('neotest').run.run() <CR>", opts)
keymap("n", "<leader>tt", ":lua require('neotest').summary.toggle() <CR>", opts)

-- Trouble.nvim
keymap("n", "<leader>dd", ":TroubleToggle document_diagnostics <CR>", opts)
