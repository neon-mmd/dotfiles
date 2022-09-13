local status,wk = pcall(require,"which-key")
if not status then
    vim.notify("ERROR: which-key not found!!")
    return
end

wk.setup({
	plugins = {
		marks = true, -- shows a list of your marks on ' and `
		registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
		spelling = {
			enabled = false, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
			suggestions = 20, -- how many suggestions should be shown in the list?
		},
		-- the presets plugin, adds help for a bunch of default keybindings in Neovim
		-- No actual key bindings are created
		presets = {
			operators = true, -- adds help for operators like d, y, ... and registers them for motion / text object completion
			motions = true, -- adds help for motions
			text_objects = true, -- help for text objects triggered after entering an operator
			windows = true, -- default bindings on <c-w>
			nav = true, -- misc bindings to work with windows
			z = true, -- bindings for folds, spelling and others prefixed with z
			g = true, -- bindings for prefixed with g
		},
	},
	-- add operators that will trigger motion and text object completion
	-- to enable all native operators, set the preset / operators plugin above
	operators = { gc = "Comments" },
	key_labels = {
		-- override the label used to display some keys. It doesn't effect WK in any other way.
		-- For example:
		-- ["<space>"] = "SPC",
		-- ["<cr>"] = "RET",
		-- ["<tab>"] = "TAB",
	},
	icons = {
		breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
		separator = "➜", -- symbol used between a key and it's label
		group = "+", -- symbol prepended to a group
	},
	popup_mappings = {
		scroll_down = "<c-d>", -- binding to scroll down inside the popup
		scroll_up = "<c-u>", -- binding to scroll up inside the popup
	},
	window = {
		border = "single", -- none, single, double, shadow
		position = "bottom", -- bottom, top
		margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
		padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
		winblend = 0,
	},
	layout = {
		height = { min = 4, max = 25 }, -- min and max height of the columns
		width = { min = 20, max = 50 }, -- min and max width of the columns
		spacing = 3, -- spacing between columns
		align = "left", -- align columns left, center or right
	},
	ignore_missing = false, -- enable this to hide mappings for which you didn't specify a label
	hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " }, -- hide mapping boilerplate
	show_help = true, -- show help message on the command line when the popup is visible
	triggers = "auto", -- automatically setup triggers
	-- triggers = {"<leader>"} -- or specify a list manually
	triggers_blacklist = {
		-- list of mode / prefixes that should never be hooked by WhichKey
		-- this is mostly relevant for key maps that start with a native binding
		-- most people should not need to change this
		i = { "j", "k" },
		v = { "j", "k" },
	},
})

--------------------------------------Global Mappings-----------------------------------

wk.register({
	f = {
		name = "+Search",
		f = { "<cmd>Telescope find_files<cr>", "Find Files" },
		r = { "<cmd>Telescope oldfiles<cr>", "Open Recent Files" },
		g = { "<cmd>Telescope live_grep<cr>", "Search Word(s)" },
	},
}, { prefix = "<leader>" })

wk.register({
	l = {
		name = "+Lsp",
		d = { "<cmd>TroubleToggle<cr>", "Toggle Trouble Diagnostics" },
		f = { "<cmd>Format<cr>", "Format Buffer" },
		i = { "<cmd>LspInstallInfo<cr>", "Lsp Install Info" },
		c = { "<cmd>Lspsaga code_actions<cr>", "Lsp Code Actions" },
		p = { "<cmd>Lspsaga hover_doc<cr>", "Lsp Preview Defination" },
		s = { "<cmd>Lspsaga show_cursor_diagnostics<cr>", "Lsp Diagnostics" },
	},
}, { prefix = "<leader>" })

wk.register({
	t = {
		name = "+Toggle",
		t = { "<cmd>ToggleTerm<cr>", "Toggle Terminal" },
		s = { "<cmd>NvimTreeToggle<cr>", "Toggle Sidebar" },
	},
}, { prefix = "<leader>" })

wk.register({
	a = {
		name = "+Applications/Utilities",
		g = { "<cmd>Neogit<cr>", "Open Git" },
		u = { "<cmd>PackerSync<cr>", "Update/Install Plugins" },
		t = { "<cmd>TodoTelescope<cr>", "Show All Todos in Telescope View" },
	},
}, { prefix = "<leader>" })

wk.register({
	g = {
		name = "+General",
		q = { "<cmd>quit!<cr>", "Quit" },
		w = { "<cmd>w!<cr>", "Write" },
		n = { "<cmd>enew<cr>", "New File" },
		c = { "<cmd>e ~/.config/nvim/init.lua<cr>", "Open config" },
		d = { "<cmd>Alpha<cr>", "Dashboard" },
		V = { "<cmd>set winbar=%f<cr>", "WinBar On" },
		v = { "<cmd>set winbar='<cr>", "WinBar Off" },
		g = { "<cmd>set laststatus=2<cr>", "Laststatus Off" },
		p = { "<cmd>Telescope project<cr>", "Open Projects" },
	},
}, { prefix = "<leader>" })

wk.register({
	r = {
		name = "+Replace",
		s = { "<cmd>lua require('spectre').open()<CR>", "Open Spectre" },
		w = { "<cmd>lua require('spectre').open_visual({select_word=true})<CR>", "Search Word" },
		v = { "<cmd>lua require('spectre').open_visual()<CR>", "Open Spectre Visual" },
		f = { "<cmd>lua require('spectre').open_file_search()<cr>", "Search in File" },
	},
}, { prefix = "<leader>" })

wk.register({
	b = {
		name = "+Buffer Order",
		b = { "<cmd>BufferOrderByBufferNumber<cr>", "Number" },
		d = { "<cmd>BufferOrderByDirectory<cr>", "Directory" },
		l = { "<cmd>BufferOrderByLanguage<cr>", "Language" },
		w = { "<cmd>BufferOrderByWindowNumber<cr>", "Window Nu Numbermber" },
	},
}, { prefix = " " })
