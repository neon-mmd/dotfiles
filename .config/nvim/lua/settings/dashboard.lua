local status_ok, alpha = pcall(require, "alpha")
if not status_ok then
	vim.notify("ERROR: alpha not found!!")
	return
end

-- needed to get random footer text
math.randomseed(os.time())

local db = require("alpha.themes.dashboard")

db.section.header.val = {
	[[                                                        ]],
	[[                                                        ]],
	[[    ███████╗ █████╗ ████████╗██╗   ██╗██╗███╗   ███╗    ]],
	[[    ██╔════╝██╔══██╗╚══██╔══╝██║   ██║██║████╗ ████║    ]],
	[[    ███████╗███████║   ██║   ██║   ██║██║██╔████╔██║    ]],
	[[    ╚════██║██╔══██║   ██║   ╚██╗ ██╔╝██║██║╚██╔╝██║    ]],
	[[    ███████║██║  ██║   ██║    ╚████╔╝ ██║██║ ╚═╝ ██║    ]],
	[[    ╚══════╝╚═╝  ╚═╝   ╚═╝     ╚═══╝  ╚═╝╚═╝     ╚═╝    ]],
	[[                                                        ]],
	[[                  A PDE for Aliens 👽!!!                ]],
	[[                                                        ]],
}

db.section.buttons.val = {
	db.button(";sq", string.format("  %s", "Query Saved Session"), ":SearchSession <CR>"),
	db.button(";gn", string.format("  %s", "New file"), ":enew <BAR> startinsert <CR>"),
	db.button(";fr", string.format("󰾆  %s", "Recently used files"), ":Telescope oldfiles <CR>"),
	db.button(
		";ff",
		string.format("󰍉  %s", "Find  File"),
		":Telescope find_files find_command=rg,--hidden,--files <CR>"
	),
	db.button(";fp", string.format("  %s", "Find project"), ":Telescope project <CR>"),
	db.button(";fg", string.format("󰊄  %s", "Find text"), ":Telescope live_grep <CR>"),
	db.button(";go", string.format("  %s", "Configuration"), ":e ~/.config/nvim/init.lua <CR>"),
	db.button(";gq", string.format("󰿅  %s", "Quit Neovim"), ":qa <CR>"),
}

local function footer()
	local randomFooterText = {
		"Neovim is great!!!",
		"Why Vim use Neovim!",
		"Vim, Vi improved!, Neovim, Lua plus Vim!",
		"Neovim is awesome",
		"I love Neovim",
		"Vi made easy!",
		"Other text editors are nuts!!!",
		"Vi is not a layer, it is a philosophy!",
		"I showed you my source code, Plz respond!",
		"Vi Vi Vi, the editor of the beast!!!",
		"While any Editor can save your work, only Neovim can save your soul",
		"Who uses VIM anyway? Go NEOVIM!",
	}

	return { "🪐 " .. randomFooterText[math.random(1, #randomFooterText)] }
end

db.section.footer.val = footer()
db.section.header.opts.hl = "Include"
db.section.buttons.opts.hl = "Keyword"

db.opts.opts.noautocmd = true
alpha.setup(db.opts)
