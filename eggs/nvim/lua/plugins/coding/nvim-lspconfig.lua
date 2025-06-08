return {
	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPost", "BufWritePost", "BufNewFile" },
	},
	{
		"mason-org/mason.nvim",
		config = true,
	},
	{
		"mason-org/mason-lspconfig.nvim",
		dependencies = {
			"mason-org/mason.nvim",
			"neovim/nvim-lspconfig",
		},
		config = true,
	},
}
