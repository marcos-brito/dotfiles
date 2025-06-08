return {
	"benlubas/molten-nvim",
	version = "^1.0.0",
	dependencies = { "3rd/image.nvim" },
	build = ":UpdateRemotePlugins",
	init = function()
		vim.g.molten_image_provider = "image.nvim"
	end,
}
