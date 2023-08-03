local workspaces = require("workspaces")

workspaces.setup({
	hooks = {
		open_pre = { "SessionSave", "bufdo :Bdelete" },
		open = { "silent SessionLoad" },
	},
})
