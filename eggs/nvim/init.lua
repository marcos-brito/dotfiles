local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end

vim.opt.rtp:prepend(lazypath)

require("options")
require("autocommands")
require("keymapping")
require("lsp")
require("lazy").setup({
	spec = {
		{ import = "plugins" },
		{ import = "plugins.ui" },
		{ import = "plugins.editing" },
		{ import = "plugins.coding" },
	},
	change_detection = {
		enabled = true,
		notify = false,
	},
})
