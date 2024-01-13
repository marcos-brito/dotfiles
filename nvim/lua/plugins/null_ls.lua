return {
    "nvimtools/none-ls.nvim",
    event = { "BufReadPost", "BufWritePost", "BufNewFile" },
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = function()
        local null_ls = require("null-ls")
        local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

        return {
            sources = {
                null_ls.builtins.formatting.stylua, --.with({ extra_args = "--indent-width 4" }),
                null_ls.builtins.formatting.prettierd, --.with({ extra_args = "--tab-width 4" }),
                null_ls.builtins.formatting.black,
                null_ls.builtins.formatting.rustfmt,
                null_ls.builtins.formatting.shfmt,
                null_ls.builtins.formatting.sql_formatter,
                null_ls.builtins.formatting.fourmolu,
                null_ls.builtins.formatting.clang_format,
                -- null_ls.builtins.diagnostics.cpplint,
                null_ls.builtins.diagnostics.eslint,
            },
            on_attach = function(client, bufnr)
                if client.supports_method("textDocument/formatting") then
                    vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
                    vim.api.nvim_create_autocmd("BufWritePre", {
                        group = augroup,
                        buffer = bufnr,
                        callback = function()
                            -- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
                            -- on later neovim version, you should use vim.lsp.buf.format({ async = false }) instead
                            vim.lsp.buf.format({ async = false })
                        end,
                    })
                end
            end,
        }
    end,
}
