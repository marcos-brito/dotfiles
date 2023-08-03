local bufferline = require("bufferline")

bufferline.setup {
    options = {
        max_tab_length = 20,
        tab_size = 20,
        enforce_regular_tabs = true,
        -- numbers = function(opts)
        --     return string.format('%s', opts.raise(opts.ordinal))
        -- end,
        middle_mouse_command = "bdelete! %d",
        indicator = {
            icon = "",
        },
        diagnostics = "nvim_lsp",
        offsets = {
            {
                filetype = "NvimTree",
                text = "File Explorer",
                highlight = "Directory",
                separator = "|" -- use a "true" to enable the default, or set your own character
            } },
        color_icons = true,
        show_buffer_icons = true,
        show_buffer_close_icons = true,
        separator_style = { "", "" },
        always_show_bufferline = false,
        highlights = {
            -- fill = {
            --     fg = '',
            --     bg = '',
            -- },
            --  background = {
            --      fg = '<colour-value-here>',
            --      bg = '<colour-value-here>'
            --  },
            --  tab = {
            --      fg = '<colour-value-here>',
            --      bg = '<colour-value-here>'
            --  },
            --  tab_selected = {
            --      fg = tabline_sel_bg,
            --      bg = '<colour-value-here>'
            --  },
            --  tab_close = {
            --      fg = '<colour-value-here>',
            --      bg = '<colour-value-here>'
            --  },
            --  close_button = {
            --      fg = '<colour-value-here>',
            --      bg = '<colour-value-here>'
            --  },
            --  close_button_visible = {
            --      fg = '<colour-value-here>',
            --      bg = '<colour-value-here>'
            --  },
            --  close_button_selected = {
            --      fg = '<colour-value-here>',
            --      bg = '<colour-value-here>'
            --  },
            --  buffer_visible = {
            --      fg = '<colour-value-here>',
            --      bg = '<colour-value-here>'
            --  },
            --  buffer_selected = {
            --      fg = normal_fg,
            --      bg = '<colour-value-here>',
            --      bold = true,
            --      italic = true,
            --  },
            -- numbers = {
            --     fg = '#fff',
            --     sp = '#d4c',
            -- },
            --TabLineSel = {bg="#d4c"},
            --  numbers_visible = {
            --      fg = '<colour-value-here>',
            --      bg = '<colour-value-here>',
            --  },
            --  numbers_selected = {
            --      fg = '<colour-value-here>',
            --      bg = '<colour-value-here>',
            --      bold = true,
            --      italic = true,
            --  },


        },


    }

}
