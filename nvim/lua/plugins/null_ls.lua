return {
	"nvimtools/none-ls.nvim",
	event = { "BufReadPost", "BufWritePost", "BufNewFile" },
	dependencies = { "nvim-lua/plenary.nvim" },
	opts = function()
		local null_ls = require("null-ls")
		local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

		return {
			sources = {
				null_ls.builtins.formatting.stylua,
				null_ls.builtins.formatting.prettier.with({
					condition = function(utils)
						return utils.root_has_file({ "package.json" })
					end,
				}),
				null_ls.builtins.formatting.black,
				null_ls.builtins.formatting.shfmt,
				null_ls.builtins.formatting.ocamlformat,
				null_ls.builtins.formatting.clang_format,
				null_ls.builtins.diagnostics.eslint,
				null_ls.builtins.formatting.gofmt,
				null_ls.builtins.diagnostics.golangci_lint,
				null_ls.builtins.diagnostics.hadolint,
				null_ls.builtins.diagnostics.yamllint,
			},
			debug = true,
			on_attach = function(client, bufnr)
				if client.supports_method("textDocument/formatting") then
					vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
					vim.api.nvim_create_autocmd("BufWritePre", {
						group = augroup,
						buffer = bufnr,
						callback = function()
							vim.lsp.buf.format({ async = false })
						end,
					})
				end
			end,
		}
	end,
}
