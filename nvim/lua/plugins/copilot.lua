return {
	"github/copilot.vim",
	event = "InsertEnter",
	opts = {},
	config = function()
		vim.keymap.set("i", "<A-CR>", 'copilot#Accept("<CR>")', {
			expr = true,
			replace_keycodes = false,
		})
		vim.g.copilot_no_tab_map = true
	end,
}
