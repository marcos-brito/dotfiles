vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

vim.cmd([[
    let g:rustfmt_autosave = 1
]])

local ignore_filetypes = { "NvimTree", "alpha" }
local ignore_buftypes = { "nofile", "prompt", "popup" }

local augroup = vim.api.nvim_create_augroup("FocusDisable", { clear = true })

vim.api.nvim_create_autocmd("WinEnter", {
	group = augroup,
	callback = function(_)
		if vim.tbl_contains(ignore_buftypes, vim.bo.buftype) then
			vim.b.focus_disable = true
		end
	end,
	desc = "Disable focus autoresize for BufType",
})

vim.api.nvim_create_autocmd("FileType", {
	group = augroup,
	callback = function(_)
		if vim.tbl_contains(ignore_filetypes, vim.bo.filetype) then
			vim.b.focus_disable = true
		end
	end,
	desc = "Disable focus autoresize for FileType",
})

vim.api.nvim_create_autocmd({
	"BufNewFile",
	"BufRead",
}, {
	pattern = "*.typ",
	callback = function()
		local buf = vim.api.nvim_get_current_buf()
		vim.api.nvim_buf_set_option(buf, "filetype", "typst")
	end,
})
