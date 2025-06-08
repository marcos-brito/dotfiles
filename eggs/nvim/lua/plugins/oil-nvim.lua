return {
	"stevearc/oil.nvim",
	opts = {
		watch_for_changes = true,
		git = {
			mv = function(src_path, dest_path)
				return true
			end,
			rm = function(path)
				return true
			end,
		},
	},
}
