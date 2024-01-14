local status, treesitter = pcall(require, "nvim-treesitter.configs")
if not status then
	vim.notify("ERROR: nvim-treesitter not found!!")
	return
end

treesitter.setup({
	ensure_installed = {
		"lua",
		"rust",
		"html",
		"cpp",
		"c",
		"css",
		"python",
		"java",
		"javascript",
		"bash",
		"markdown",
		"markdown_inline",
	},
	sync_install = false,
	auto_install = false,
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = true,
	},
	indent = {
		enable = true,
	},
	refactor = {
		highlight_definitions = {
			enable = true,
			clear_on_cursor_move = true,
		},
		smart_rename = {
			enable = true,
			keymaps = {
				smart_rename = "gsr",
			},
		},
	},
	rainbow = {
		enable = true,
		extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
		max_file_lines = nil, -- Do not enable for files with more than n lines, int
		-- query = 'rainbow-parens',
		-- strategy = require("ts-rainbow").strategy.global,
	},
	autotag = {
		enable = true,
		filetypes = {
			"html",
			"javascript",
			"typescript",
			"javascriptreact",
			"typescriptreact",
			"svelte",
			"vue",
			"tsx",
			"jsx",
			"rescript",
			"xml",
			"php",
			"markdown",
			"glimmer",
			"handlebars",
			"hbs",
		},
	},
	markid = {
		enable = true,
	},
})
