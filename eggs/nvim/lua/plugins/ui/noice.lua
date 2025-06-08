return {
	{
		"MunifTanjim/nui.nvim",
	},
	{
		"rcarriga/nvim-notify",
		opts = {
			render = "compact",
			stages = "fade",
		},
	},
	{
		"folke/noice.nvim",
		dependencies = {
			"MunifTanjim/nui.nvim",
			"rcarriga/nvim-notify",
		},
		opts = {
			presets = {
				-- bottom_search = true,
				long_message_to_split = true,
			},
			cmdline = {
				-- view = "cmdline",
			},
			lsp = {
				-- Using blink for this
				signature = {
					enabled = false,
				},
			},
		},
	},
}
