return {
	{
		"sainnhe/gruvbox-material",
		opts = {},
		config = function()
			vim.g.gruvbox_material_background = "hard"
			vim.g.gruvbox_material_better_performance = 1
			vim.cmd("colorscheme gruvbox-material")
		end,
	},
	{
		"sainnhe/everforest",
		enabled = false,
		opts = {},
		config = function()
			vim.g.everforest_background = "hard"
			vim.g.everforest_better_performance = 1
			vim.g.everforest_colors_override = {
				bg0 = { "#1e2326", "233" },
				bg_dim = { "#272e33", "235" },
			}
			vim.cmd("colorscheme everforest")
		end,
	},
	{
		"catppuccin/nvim",
		enabled = false,
		opts = {
			flavour = "mocha", -- latte, frappe, macchiato, mocha
			background = {
				-- :h background
				light = "latte",
				dark = "mocha",
			},
			transparent_background = false, -- disables setting the background color.
			show_end_of_buffer = false, -- shows the '~' characters after the end of buffers
			term_colors = false, -- sets terminal colors (e.g. `g:terminal_color_0`)
			dim_inactive = {
				enabled = false, -- dims the background color of inactive window
				shade = "dark",
				percentage = 0.15, -- percentage of the shade to apply to the inactive window
			},
			no_italic = false, -- Force no italic
			no_bold = false, -- Force no bold
			no_underline = false, -- Force no underline
			styles = {
				-- Handles the styles of general hi groups (see `:h highlight-args`):
				comments = { "italic" }, -- Change the style of comments
				conditionals = {},
				loops = {},
				functions = {},
				keywords = {},
				strings = {},
				variables = {},
				numbers = {},
				booleans = {},
				properties = {},
				types = {},
				operators = {},
			},
			color_overrides = {
				all = {
					-- crust = "#181724",
					-- mantle = "#181724",
					-- base = "#11111b"
					crust = "#11111b",
					mantle = "#1E1E2E",
					base = "#181724",
				},
			},
			custom_highlights = function(colors)
				return {
					CursorLine = { bg = colors.base },

					StorageClass = { fg = colors.red },
					Structure = { fg = colors.red },
					Number = { fg = colors.lavender },
					Float = { fg = colors.lavender },
					Boolean = { fg = colors.pink },
					Operator = { fg = colors.text },

					Function = { fg = colors.blue },
					["@function.builtin"] = { fg = colors.blue },
					["@function"] = { fg = colors.blue },
					["@function.macro"] = { fg = colors.blue },

					["@parameter"] = { fg = colors.text },
					["@property"] = { fg = colors.text },
					["@field"] = { fg = colors.text },

					Include = { fg = colors.mauve },
					["@keyword.export"] = { fg = colors.lavender },
					["@namespace"] = { fg = colors.text },

					["@punctuation.special"] = { fg = colors.green },
					["@punctuation.delimiter"] = { fg = colors.red },

					["@tag"] = { fg = colors.red },
					["@tag.attribute"] = { fg = colors.mauve },
					["@tag.delimiter"] = { fg = colors.text },

					TelescopeBorder = { fg = colors.mantle, bg = colors.mantle },
					TelescopeNormal = { bg = colors.mantle },
					TelescopePromptNormal = {
						bg = colors.surface0,
						fg = colors.text,
					},
					TelescopePromptBorder = {
						bg = colors.surface0,
						fg = colors.surface0,
					},
					TelescopePreviewTitle = {
						fg = colors.black,
						bg = colors.green,
					},

					TelescopePromptTitle = {
						fg = colors.black,
						bg = colors.red,
					},

					TelescopeResultsTitle = {
						fg = colors.darker_black,
						bg = colors.darker_blue,
					},
					TelescopeSelection = { bg = "#1E1E2E", fg = colors.lavender },
				}
			end,
			integrations = {
				cmp = true,
				gitsigns = true,
				nvimtree = true,
				telescope = true,
				notify = true,
				neotest = true,
				mason = true,
				lsp_saga = true,
				mini = false,
				dap = {
					enabled = true,
					enable_ui = true,
				},
			},
		},
		config = function()
			vim.cmd("colorscheme catppuccin-mocha")
		end,
	},
}
