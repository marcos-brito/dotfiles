local neotest = require("neotest")
neotest.setup({
	adapters = {
		require("neotest-jest")({
			jestCommand = "npm test --",
		}),
		require("neotest-rust"),
		output = {
			enable = true,
			open_on_run = true,
		},
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
