return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPost", "BufWritePost", "BufNewFile" },
	dependencies = { "neovim/nvim-lspconfig" },
	opts = {
		title = true,
		border = "rounded",
		winblend = 0,
		expand = "",
		collapse = "",
		code_action = "",
		incoming = " ",
		outgoing = " ",
		hover = " ",
		kind = {},
	},
	config = function()
		local lsp_config = require("lspconfig")
		local capabilities = vim.lsp.protocol.make_client_capabilities()
		capabilities.textDocument.completion.completionItem.snippetSupport = true

		lsp_config.pyright.setup({})
		lsp_config.lua_ls.setup({})
		lsp_config.denols.setup({
			root_dir = lsp_config.util.root_pattern("deno.json", "deno.jsonc"),
		})
		lsp_config.ts_ls.setup({
			root_dir = lsp_config.util.root_pattern("package.json"),
			single_file_support = false,
		})
		lsp_config.tinymist.setup({
			single_file_support = true,
			offset_encoding = "utf-8",
			root_dir = function()
				return vim.fn.getcwd()
			end,
			settings = {
				exportPdf = "onSave",
				outputPath = "$root/target/$dir/$name",
				formatterMode = "typstyle",
				showExportFileIn = "zathura",
			},
		})
		lsp_config.html.setup({})
		lsp_config.jdtls.setup({})
		lsp_config.ruby_lsp.setup({})
		lsp_config.asm_lsp.setup({})
		lsp_config.jsonls.setup({})
		lsp_config.prismals.setup({})
		lsp_config.vimls.setup({})
		lsp_config.bashls.setup({})
		lsp_config.taplo.setup({})
		lsp_config.dockerls.setup({})
		lsp_config.graphql.setup({
			root_dir = function(startpath)
				return M.search_ancestors(startpath, matcher)
			end,
		})
		lsp_config.hls.setup({})
		lsp_config.ocamllsp.setup({})
		lsp_config.gopls.setup({})
		lsp_config.astro.setup({})
		lsp_config.svelte.setup({})
		lsp_config.pest_ls.setup({})
		lsp_config.tailwindcss.setup({})

		lsp_config.cssls.setup({
			capabilities = capabilities,
		})

		lsp_config.clangd.setup({
			cmd = {
				"clangd",
				"--offset-encoding=utf-16",
			},
		})

		lsp_config.rust_analyzer.setup({
			filetypes = { "rust" },
			settings = {
				["rust-analyzer"] = {
					cargo = {
						allFeatures = true,
					},
				},
			},
		})
	end,
}
