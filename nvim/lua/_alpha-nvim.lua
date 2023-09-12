local alpha = require("alpha")

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
local function footer()
	return "De wanna wanga"
end

dashboard.section.footer.val = footer()

dashboard.section.footer.opts.hl = "Type"
dashboard.section.header.opts.hl = "Include"
dashboard.section.buttons.opts.hl = "Keyword"

dashboard.opts.opts.noautocmd = true
alpha.setup(dashboard.opts)
