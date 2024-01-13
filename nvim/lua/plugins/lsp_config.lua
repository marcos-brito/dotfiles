return {
    "neovim/nvim-lspconfig",
    dependencies = {"neovim/nvim-lspconfig"},
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
    config = function ()
        local lsp_config = require("lspconfig")
        local capabilities = vim.lsp.protocol.make_client_capabilities()
        capabilities.textDocument.completion.completionItem.snippetSupport = true

        lsp_config.pyright.setup({})
        lsp_config.lua_ls.setup({})
        lsp_config.tsserver.setup({})
        lsp_config.html.setup({})
        lsp_config.jdtls.setup({})
        lsp_config.jsonls.setup({})
        lsp_config.prismals.setup({})
        lsp_config.vimls.setup({})
        lsp_config.bashls.setup({})
        lsp_config.hls.setup({})
        lsp_config.gopls.setup({})

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

    end
}
