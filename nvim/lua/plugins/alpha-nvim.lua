return {
	"goolord/alpha-nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	event = "VimEnter",
	opts = function()
		local dashboard = require("alpha.themes.dashboard")
		dashboard.section.header.val = {
			[[                          .                      .         ]],
			[[         .             -)------+====+       .              ]],
			[[               -)----====    ,'   ,'   .                  .]],
			[[  .                  `.  `.,;___,'                .        ]],
			[[                       `, |____l_\                         ]],
			[[        _,.....------c==]""______ |,,,,,,.....____ _       ]],
			[[       "-:______________  |____l_|]'''''''''''       .     ]],
			[[                      ,'"",'.   `.                         ]],
			[[               -)-----====   `.   `.              LS       ]],
			[[         .            -)-------+====+       .             .]],
			[[ .                               .                         ]],
		}

		dashboard.section.buttons.val = {
			dashboard.button("s", "󱛞 " .. " Restore session", ":silent SessionLoadLast <CR>"),
			dashboard.button("f", " " .. " Find file", ":Telescope find_files <CR>"),
			dashboard.button("e", "󱀲 " .. " New file", ":ene <BAR> startinsert <CR>"),
			dashboard.button("p", " " .. " Find project", ":Telescope workspaces <CR>"),
			dashboard.button("r", " " .. " Recent files", ":Telescope oldfiles <CR>"),
			dashboard.button("d", " " .. " Database", ":lua require('dbee').open() <CR>"),
			dashboard.button("q", " " .. " Quit", ":qa<CR>"),
		}

		dashboard.section.footer.val = "De wanna wanga"
		dashboard.section.footer.opts.hl = "Type"
		dashboard.section.header.opts.hl = "Include"
		dashboard.section.buttons.opts.hl = "Keyword"
		dashboard.opts.opts.noautocmd = true

		return dashboard
	end,
	config = function(_, dashboard)
		-- close Lazy and re-open when the dashboard is ready
		if vim.o.filetype == "lazy" then
			vim.cmd.close()
			vim.api.nvim_create_autocmd("User", {
				once = true,
				pattern = "AlphaReady",
				callback = function()
					require("lazy").show()
				end,
			})
		end

		require("alpha").setup(dashboard.opts)
	end,
}
