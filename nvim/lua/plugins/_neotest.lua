return {
    "nvim-neotest/neotest",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "antoinemadec/FixCursorHold.nvim",
        "nvim-treesitter/nvim-treesitter"
    }
    opts = {
        adapters = {
            require("neotest-jest")({
                jestCommand = "npm test --",
            }),
            require("neotest-rust"),
            output = {
                enable = true,
                open_on_run = true,
            },
        },
        icons = {
            collapsed = "",
            expanded = "",
            child_indent = "",
            child_prefix = "",
            final_child_prefix = "",
            non_collapsible = "  ",
        },
    }
}
