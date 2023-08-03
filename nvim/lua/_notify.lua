local notify = require("notify")

vim.notify = notify

notify.setup({
	render = "compact",
	stages = "fade",
	background_colour = "#181724",
})
