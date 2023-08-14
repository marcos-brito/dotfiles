local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
        vim.cmd([[packadd packer.nvim]])
        return true
    end
    return false
end

local packer_bootstrap = ensure_packer()

return require("packer").startup(function(use)
    -- Packer can manage itself
    use("wbthomason/packer.nvim")

    use("nvim-lua/plenary.nvim")

    -- Icons
    use("nvim-tree/nvim-web-devicons")

    -- Files thing
    use({ "nvim-telescope/telescope.nvim", tag = "0.1.0" })
    use("nvim-tree/nvim-tree.lua")
    use("nvim-telescope/telescope-file-browser.nvim")

    -- Highlights
    use("nvim-treesitter/nvim-treesitter")

    -- Themes
    use({ "catppuccin/nvim", as = "catppuccin" })
    use("sainnhe/gruvbox-material")
    use("sainnhe/everforest")

    -- Buffer stuff
    use("noib3/nvim-cokeline")
    use("moll/vim-bbye")

    -- Start screen
    use("goolord/alpha-nvim")

    -- Terminal
    use("akinsho/toggleterm.nvim")

    -- Editing stuff
    use("matze/vim-move")
    use("mg979/vim-visual-multi")
    use("RRethy/vim-illuminate")
    use("numToStr/Comment.nvim")

    -- UI
    use("Pocco81/true-zen.nvim")
    use("lukas-reineke/indent-blankline.nvim")
    use("NvChad/nvim-colorizer.lua")
    use({
        "nvim-lualine/lualine.nvim",
        requires = { "kyazdani42/nvim-web-devicons", opt = true },
    })

    -- Git
    use("lewis6991/gitsigns.nvim")

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

    --Project
    use("natecraddock/workspaces.nvim")

    --Image viewer
    use("m00qek/baleia.nvim")
    use("samodostal/image.nvim")

    --LSP
    use("neovim/nvim-lspconfig")
    use("williamboman/mason.nvim")
    use("williamboman/mason-lspconfig.nvim")
    use("jose-elias-alvarez/null-ls.nvim")
    use("glepnir/lspsaga.nvim")
    use("nanotee/sqls.nvim")

    -- Productivity
    use("rest-nvim/rest.nvim")
    use("olimorris/persisted.nvim")
    use("m4xshen/hardtime.nvim")
    use("nvim-focus/focus.nvim")
    use({ "anuvyklack/windows.nvim", requires = "anuvyklack/middleclass" })

    -- Debug
    use("mfussenegger/nvim-dap")
    use("rcarriga/nvim-dap-ui")

    -- Neotest
    use("nvim-neotest/neotest")
    use("haydenmeade/neotest-jest")
    use("rouge8/neotest-rust")
    use("nvim-neotest/neotest-go")

    -- Notify
    use("rcarriga/nvim-notify")

    use("antoinemadec/FixCursorHold.nvim")

    if packer_bootstrap then
        require("packer").sync()
    end
end)
