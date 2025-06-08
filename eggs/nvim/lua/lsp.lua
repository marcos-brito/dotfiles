vim.diagnostic.config({
	virtual_text = true,
	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = "",
			[vim.diagnostic.severity.WARN] = "",
			[vim.diagnostic.severity.INFO] = "",
			[vim.diagnostic.severity.HINT] = "󰌵",
		},
	},
})

vim.lsp.config("rust_analyzer", {
	settings = {
		["rust-analyzer"] = {
			cargo = {
				features = "all",
				-- target = "x86_64-apple-darwin",
				target = "x86_64-pc-windows-gnu",
				-- target = "x86_64-unknown-freebsd",
			},
		},
	},
})

vim.lsp.config("jdtls", {
	cmd = {
		"jdtls",
		"--jvm-arg=" .. "-javaagent:" .. vim.fn.expand("$HOME/.local/share/nvim/mason/packages/jdtls/lombok.jar"),
	},
})

vim.lsp.config("ltex_plus", {
	settings = {
		ltex = {
			-- language = "pt-BR",
		},
	},
})

vim.lsp.config("tinymist", {
	single_file_support = true,
	offset_encoding = "utf-8",
	root_dir = function()
		return vim.fn.getcwd()
	end,
	settings = {
		exportPdf = "onType",
		outputPath = "$root/target/$dir/$name",
		formatterMode = "typstyle",
		showExportFileIn = "zathura",
	},
})
