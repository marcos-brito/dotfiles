local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({
			"git",
			"clone",
			"--depth",
			"1",
			"https://github.com/wbthomason/packer.nvim",
			install_path,
		})
		vim.cmd([[packadd packer.nvim]])
		return true
	end
	return false
end

return require("packer").startup(function(use)
	-- Packer can manage itself
	use("wbthomason/packer.nvim")

	use("nvim-lua/plenary.nvim")

	-- Icons
	use("nvim-tree/nvim-web-devicons")

	-- Files thing
	use({ "nvim-telescope/telescope.nvim" })
	use("stevearc/oil.nvim")

	-- Highlights
	use("nvim-treesitter/nvim-treesitter")

	-- Themes
	use({ "catppuccin/nvim", as = "catppuccin" })
	use("sainnhe/gruvbox-material")
	use("sainnhe/everforest")

	-- Start screen
	use("goolord/alpha-nvim")

	-- Terminal
	use("akinsho/toggleterm.nvim")

	-- Editing stuff
	use("RRethy/vim-illuminate")
	use("numToStr/Comment.nvim")

	-- UI
	use("lukas-reineke/indent-blankline.nvim")
	use("NvChad/nvim-colorizer.lua")
	use({
		"nvim-lualine/lualine.nvim",
		requires = { "kyazdani42/nvim-web-devicons", opt = true },
	})

	-- Git
	use("lewis6991/gitsigns.nvim")
	use("tpope/vim-fugitive")

	--AutoComplete
	use("hrsh7th/nvim-cmp")
	use("saadparwaiz1/cmp_luasnip")
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/cmp-path")
	use("hrsh7th/cmp-nvim-lsp")
	use("windwp/nvim-autopairs")
	use("windwp/nvim-ts-autotag")

	-- Snippets
	use({ "L3MON4D3/LuaSnip", tag = "v<CurrentMajor>.*" })
	use("rafamadriz/friendly-snippets")

	--Markdown
	use("preservim/vim-markdown")
	use("godlygeek/tabular")
	use({
		"iamcco/markdown-preview.nvim",
		run = "cd app && npm install",
		setup = function()
			vim.g.mkdp_filetypes = { "markdown" }
		end,
		ft = { "markdown" },
	})

	--LSP
	use("neovim/nvim-lspconfig")
	use("williamboman/mason.nvim")
	use("williamboman/mason-lspconfig.nvim")
	use("nvimtools/none-ls.nvim")
	use("glepnir/lspsaga.nvim")
	use("nanotee/sqls.nvim")
	use("folke/trouble.nvim")

	-- Productivity
	use("rest-nvim/rest.nvim")
	use("m4xshen/hardtime.nvim")
	use("nvim-focus/focus.nvim")
	use("github/copilot.vim")
	use("tpope/vim-obsession")

	-- Debug
	use("mfussenegger/nvim-dap")
	use("rcarriga/nvim-dap-ui")

	-- Neotest
	use("nvim-neotest/neotest")
	use("haydenmeade/neotest-jest")
	use("rouge8/neotest-rust")
	use("nvim-neotest/neotest-go")

	--Database
	use("tpope/vim-dadbod")
	use("kristijanhusak/vim-dadbod-ui")
	use("kristijanhusak/vim-dadbod-completion")
	use({
		"kndndrj/nvim-dbee",
		run = function()
			-- Install tries to automatically detect the install method.
			-- if it fails, try calling it with one of these parameters:
			--    "curl", "wget", "bitsadmin", "go"
			require("dbee").install()
		end,
		config = function()
			require("dbee").setup( --[[optional config]])
		end,
	})

	-- Notify
	use("rcarriga/nvim-notify")

	use("MunifTanjim/nui.nvim")
	use("antoinemadec/FixCursorHold.nvim")
	use("andweeb/presence.nvim")
	if packer_bootstrap then
		require("packer").sync()
	end
end)
