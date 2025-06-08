return {
	{ "L3MON4D3/LuaSnip", version = "v2.*" },
	{ "rafamadriz/friendly-snippets" },
	{
		"fang2hou/blink-copilot",
		opts = {},
	},
	{
		"saghen/blink.cmp",
		version = "1.*",
		dependencies = {
			"rafamadriz/friendly-snippets",
			"fang2hou/blink-copilot",
			"L3MON4D3/LuaSnip",
		},
		opts = {
			signature = {
				enabled = true,
				window = {
					border = "rounded",
				},
			},
			snippets = { preset = "luasnip" },
			fuzzy = { implementation = "prefer_rust_with_warning" },
			keymap = {
				preset = "default",
				["<C-k>"] = { "select_prev", "fallback" },
				["<C-j>"] = { "select_next", "fallback" },
				["<CR>"] = { "accept", "fallback" },
			},
			completion = {
				list = {
					selection = {
						preselect = false,
					},
				},
				menu = {
					border = "rounded",
					draw = {
						padding = 2,
						gap = 4,
						columns = {
							{ "kind_icon" },
							{ "label" },
							{ "kind" },
						},
					},
				},
			},
			cmdline = {
				keymap = { preset = "inherit" },
				completion = {
					list = {
						selection = {
							preselect = false,
						},
					},
					menu = { auto_show = true },
					ghost_text = { enabled = false },
				},
			},
			sources = {
				default = { "lsp", "buffer", "snippets", "path", "copilot" },
				providers = {
					copilot = {
						name = "copilot",
						module = "blink-copilot",
						score_offset = 100,
						async = true,
					},
				},
			},
		},
	},
}
