return {
	"nvim-neotest/neotest",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"antoinemadec/FixCursorHold.nvim",
		"nvim-treesitter/nvim-treesitter",
	},
	opts = {
		adapters = {},
		icons = {
			collapsed = "",
			expanded = "",
			child_indent = "",
			child_prefix = "",
			final_child_prefix = "",
			non_collapsible = "  ",
		},
	},
}
