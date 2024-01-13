return {
	"nvim-treesitter/nvim-treesitter",
	opts = {},
	config = function()
		local configs = require("nvim-treesitter.configs")

		configs.setup({
			-- ensure_installed = "all", -- one of "all" or a list of languages
			highlight = {
				enable = true, -- false will disable the whole extension
			},
			autopairs = {
				enable = true,
			},
			autotag = {
				enable = true,
			},
			indent = { enable = true },
		})
	end,
}
