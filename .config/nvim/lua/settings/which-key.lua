local status, wk = pcall(require, "which-key")
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
		f = { "<cmd>Telescope find_files<cr>", "Find [F]iles" },
		r = { "<cmd>Telescope oldfiles<cr>", "Open [R]ecent Files" },
		g = { "<cmd>Telescope live_grep<cr>", "Search Word(s) Like [G]rep" },
		p = { "<cmd>Telescope project<cr>", "Open [P]rojects" },
		c = { "<cmd>Telescope current_buffer_fuzzy_find<cr>", "Search Word in [C]urrent Buffer" },
	},
}, { prefix = "<leader>" })

wk.register({
	l = {
		name = "+Lsp",
		d = { "<cmd>Telescope diagnostics<cr>", "Show [D]iagnostics using Telescope" },
		f = { "<cmd>Format<cr>", "[F]ormat Buffer" },
		i = { "<cmd>Mason<cr>", "Lsp [I]nstall Info" },
		c = { "<cmd>Lspsaga code_action<cr>", "Lsp [C]ode Actions" },
		p = { "<cmd>Lspsaga hover_doc<cr>", "Lsp [P]review Defination" },
		s = { "<cmd>Lspsaga show_cursor_diagnostics<cr>", "Lsp [S]how Diagnostics Under Cursor" },
		h = { "<cmd>Telescope lsp_document_symbols<cr>", "Show Document Symbols/[H]eadings" },
	},
}, { prefix = "<leader>" })

wk.register({
	t = {
		name = "+Toggle",
		t = { "<cmd>ToggleTerm<cr>", "Toggle [T]erminal" },
		s = { "<cmd>NvimTreeToggle<cr>", "Toggle [S]idebar" },
		l = { "<cmd>lua require('lsp_lines').toggle()<cr>", "Toggle Lsp [L]ines" },
	},
}, { prefix = "<leader>" })

wk.register({
	a = {
		name = "+Applications/Utilities",
		g = { "<cmd>Neogit<cr>", "Open [G]it" },
		u = { "<cmd>PackerSync<cr>", "[U]pdate/Install Plugins" },
		t = { "<cmd>TodoTelescope<cr>", "Show All [T]odos in Telescope View" },
		c = { "<cmd>PickColorInsert<cr>", "[C]olor Picker" },
		i = { "<cmd>IconPickerInsert<cr>", "[I]con Picker" },
		a = { "<cmd>CoAuthor<cr>", "[C]o author picker for git commits" },
	},
}, { prefix = "<leader>" })

wk.register({
	g = {
		name = "+General",
		q = { "<cmd>quit!<cr>", "[Q]uit" },
		w = { "<cmd>w!<cr>", "[W]rite" },
		n = { "<cmd>enew<cr>", "[N]ew File" },
		o = { "<cmd>e ~/.config/nvim/init.lua<cr>", "[O]pen config" },
		d = { "<cmd>Alpha<cr>", "[D]ashboard" },
		V = { "<cmd>set winbar=%f<cr>", "[V]inBar On" },
		v = { "<cmd>set winbar='<cr>", "[v]inBar Off" },
		p = { "<cmd>set laststatus=2<cr>", "[P]ut Laststatus Off" },
	},
}, { prefix = "<leader>" })

wk.register({
	b = {
		name = "+Buffers",
		b = { "<cmd>Telescope buffers<cr>", "[B]uffer Management" },
	},
}, { prefix = "<leader>" })

wk.register({
	s = {
		name = "+Sessions",
		s = { "<cmd>SaveSession<cr>", "[S]ave Current Session" },
		q = { "<cmd>SearchSession<cr>", "[Q]uery all Saved Sessions" },
	},
}, { prefix = "<leader>" })
