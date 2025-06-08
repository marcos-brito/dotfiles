return {
	{
		"catppuccin/nvim",
		config = function(_, opts)
			require("catppuccin").setup(opts)
			vim.cmd.colorscheme("catppuccin")
		end,
		opts = {
			color_overrides = {
				all = {
					rosewater = "#DDC7A1", -- {< replace_color(data.theme.base06) >}
					flamingo = "#BB7351", -- {< replace_color(data.theme.base0F) >}
					red = "#EA6962", -- {< replace_color(data.theme.base08) >}
					maroon = "#FF8A80", -- {< replace_color(data.theme.base12) >}
					pink = "#F29BB4", -- {< replace_color(data.theme.base17) >}
					mauve = "#D3869B", -- {< replace_color(data.theme.base0E) >}
					peach = "#E78A4E", -- {< replace_color(data.theme.base09) >}
					yellow = "#D8A657", -- {< replace_color(data.theme.base0A) >}
					green = "#A9B665", -- {< replace_color(data.theme.base0B) >}
					teal = "#89B482", -- {< replace_color(data.theme.base0C) >}
					sky = "#A4D79E", -- {< replace_color(data.theme.base15) >}
					sapphire = "#9FD3C4", -- {< replace_color(data.theme.base16) >}
					blue = "#7DAEA3", -- {< replace_color(data.theme.base0D) >}
					lavender = "#E3D4B3", -- {< replace_color(data.theme.base07) >}
					text = "#D4BE98", -- {< replace_color(data.theme.base05) >}
					subtext1 = "#D4BE98", -- {< replace_color(data.theme.base05) >}
					subtext0 = "#D4BE98", -- {< replace_color(data.theme.base05) >}
					overlay2 = "#7C6F64", -- {< replace_color(data.theme.base03) >}
					overlay1 = "#D4BE98", -- {< replace_color(data.theme.base05) >}
					overlay0 = "#D4BE98", -- {< replace_color(data.theme.base05) >}
					surface2 = "#928374", -- {< replace_color(data.theme.base04) >}
					surface1 = "#7C6F64", -- {< replace_color(data.theme.base03) >}
					surface0 = "#282828", -- {< replace_color(data.theme.base02) >}
					base = "#141617", -- {< replace_color(data.theme.base00) >}
					crust = "#0E0F10", -- {< replace_color(data.theme.base11) >}
					mantle = "#101112", -- {< replace_color(data.theme.base10) >}
				},
			},
			custom_highlights = function(colors)
				return {
					BlinkCmpMenu = { bg = colors.base },
					BlinkCmpSignatureHelpBorder = { fg = colors.blue },
				}
			end,
			integrations = {
				blink_cmp = true,
				gitsigns = true,
				telescope = true,
				treesitter = true,
				notify = true,
				neotest = true,
				mason = true,
				lsp_saga = true,
				symbols_outline = true,
				flash = true,
				harpoon = true,
			},
		},
	},
}
