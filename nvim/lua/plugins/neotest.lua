return {
	"nvim-neotest/neotest",
	lazy = true,
	dependencies = {
		"nvim-neotest/nvim-nio",
		"nvim-lua/plenary.nvim",
		"antoinemadec/FixCursorHold.nvim",
		"nvim-treesitter/nvim-treesitter",
		"nvim-neotest/neotest-go",
		"nvim-neotest/neotest-jest",
		"marilari88/neotest-vitest",
		"rouge8/neotest-rust",
	},
	config = function()
		local neotest = require("neotest")

		neotest.setup({
			adapters = {
				require("neotest-go"),
				require("neotest-jest"),
				require("neotest-rust"),
				require("neotest-vitest"),
			},
			icons = {
				collapsed = "",
				expanded = "",
				child_indent = "",
				child_prefix = "",
				final_child_prefix = "",
				non_collapsible = "  ",
			},
		})
	end,
}
