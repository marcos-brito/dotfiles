local mason = require("mason")
local mason_lsp_config = require("mason-lspconfig")
local lsp_config = require("lspconfig")
local lsp_saga = require("lspsaga")

lsp_saga.setup({
    ui = {
        -- This option only works in Neovim 0.9
        title = true,
        -- Border type can be single, double, rounded, solid, shadow.
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
})

local signs = { Error = "", Warn = "", Hint = " ", Info = "" }
for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

mason.setup({})
mason_lsp_config.setup({})

vim.keymap.set("n", "gf", "<cmd>Lspsaga finder<CR>", { silent = true })
vim.keymap.set("n", "gd", "<cmd>Lspsaga goto_definition<CR>", { silent = true })
vim.keymap.set("n", "K", "<Cmd>Lspsaga hover_doc<cr>", { silent = true })
vim.keymap.set({ "n", "v" }, "<leader>ca", "<cmd>Lspsaga code_action<CR>", { silent = true })
vim.keymap.set("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", { silent = true })

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

lsp_config.cssls.setup({
    capabilities = capabilities,
})
lsp_config.pyright.setup({})
lsp_config.lua_ls.setup({})
lsp_config.tsserver.setup({})
lsp_config.html.setup({})
lsp_config.clangd.setup({})
lsp_config.jdtls.setup({})
lsp_config.jsonls.setup({})
lsp_config.prismals.setup({})
lsp_config.vimls.setup({})
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

lsp_config.gopls.setup({})
lsp_config.sqls.setup({
    on_attach = function(client, bufnr)
        require("sqls").on_attach(client, bufnr)
    end,
    settings = {
        sqls = {
            connections = {
                {
                    driver = "mysql",
                    dataSourceName = "",

                    --username:password@tcp:(host:port)/database
                },
                {
                    driver = "postgresql",
                    dataSourceName = "",

                    -- host=127.0.0.1 port=15432 user=postgres password=mysecretpassword1234 dbname=dvdrental sslmode=disable
                },
            },
        },
    },
})
