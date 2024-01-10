local workspaces = require("workspaces")

workspaces.setup({
	hooks = {
		open_pre = { "silent SessionSave", "silent bufdo :Bdelete" },
		open = { "silent SessionLoad" },
	},
})
