local status, telescope = pcall(require, "telescope")
if not status then
	vim.notify("ERROR: telescope not found!!")
	return
end

local status, action_state = pcall(require, "telescope.actions.state")
if not status then
	vim.notify("ERROR: telescope.actions.state not found!!")
	return
end

local status, actions = pcall(require, "telescope.actions")
if not status then
	vim.notify("ERROR: telescope.actions not found!!")
	return
end

telescope.setup({
	extensions = {
		fzf = {
			fuzzy = true, -- false will only do exact matching
			override_generic_sorter = true, -- override the generic sorter
			override_file_sorter = true, -- override the file sorter
			case_mode = "smart_case", -- or "ignore_case" or "respect_case"
			-- the default case_mode is "smart_case"
			theme = "ivy",
			sorting_strategy = "ascending",
			layout_strategy = "bottom_pane",
			layout_config = {
				height = 8,
			},
			borderchars = {
				prompt = { "─", " ", " ", " ", "─", "─", " ", " " },
				results = { " " },
				preview = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
			},
			-- width = 0.8,
			previewer = false,
			prompt_prefix = "Fzf> ",
			prompt_title = false,
			results_title = false,
			-- border = false,
			winblend = 20,
			show_line = false,
		},
		project = {
			fuzzy = true, -- false will only do exact matching
			base_dirs = {
				"/run/media/destruct/projects/git-repos/",
			},
			hidden_files = true, -- default: false
			theme = "ivy",
			sorting_strategy = "ascending",
			layout_strategy = "bottom_pane",
			layout_config = {
				height = 8,
			},
			borderchars = {
				prompt = { "─", " ", " ", " ", "─", "─", " ", " " },
				results = { " " },
				preview = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
			},
			-- width = 0.8,
			previewer = false,
			prompt_prefix = "Project> ",
			prompt_title = false,
			results_title = false,
			-- border = false,
			winblend = 20,
			show_line = false,
		},
	},
	pickers = {
		buffers = {
			fuzzy = true,
			theme = "ivy",
			sorting_strategy = "ascending",
			layout_strategy = "bottom_pane",
			layout_config = {
				height = 8,
			},
			borderchars = {
				prompt = { "─", " ", " ", " ", "─", "─", " ", " " },
				results = { " " },
				preview = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
			},
			-- width = 0.8,
			previewer = false,
			prompt_prefix = "Buffers> ",
			prompt_title = false,
			results_title = false,
			-- border = false,
			winblend = 20,
			show_line = false,
			attach_mappings = function(prompt_bufnr, map)
				local delete_buf = function()
					local selection = action_state.get_selected_entry()
					actions.close(prompt_bufnr)
					vim.api.nvim_buf_delete(selection.bufnr, { force = true })
				end

				map("i", "d", delete_buf)

				return true
			end,
		},
		find_files = {
			fuzzy = true,
			theme = "ivy",
			sorting_strategy = "ascending",
			layout_strategy = "bottom_pane",
			layout_config = {
				height = 8,
			},
			borderchars = {
				prompt = { "─", " ", " ", " ", "─", "─", " ", " " },
				results = { " " },
				preview = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
			},
			-- width = 0.8,
			previewer = false,
			prompt_prefix = "Files> ",
			prompt_title = false,
			results_title = false,
			-- border = false,
			winblend = 20,
			show_line = false,
		},
		current_buffer_fuzzy_find = {
			fuzzy = true,
			theme = "ivy",
			sorting_strategy = "ascending",
			layout_strategy = "bottom_pane",
			layout_config = {
				height = 8,
			},
			borderchars = {
				prompt = { "─", " ", " ", " ", "─", "─", " ", " " },
				results = { " " },
				preview = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
			},
			-- width = 0.8,
			previewer = false,
			prompt_prefix = "Search in Current Buffer> ",
			prompt_title = false,
			results_title = false,
			-- border = false,
			winblend = 20,
			show_line = false,
		},
		live_grep = {
			fuzzy = true, -- false will only do exact matching
			theme = "ivy",
			sorting_strategy = "ascending",
			layout_strategy = "bottom_pane",
			layout_config = {
				height = 8,
			},
			borderchars = {
				prompt = { "─", " ", " ", " ", "─", "─", " ", " " },
				results = { " " },
				preview = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
			},
			-- width = 0.8,
			previewer = false,
			prompt_prefix = "Search> ",
			prompt_title = false,
			results_title = false,
			-- border = false,
			winblend = 20,
			show_line = false,
		},
		diagnostics = {
			fuzzy = true, -- false will only do exact matching
			theme = "ivy",
			sorting_strategy = "ascending",
			layout_strategy = "bottom_pane",
			layout_config = {
				height = 8,
			},
			borderchars = {
				prompt = { "─", " ", " ", " ", "─", "─", " ", " " },
				results = { " " },
				preview = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
			},
			-- width = 0.8,
			previewer = false,
			prompt_prefix = "Diagnostics> ",
			prompt_title = false,
			results_title = false,
			-- border = false,
			winblend = 20,
			show_line = false,
		},
		lsp_document_symbols = {
			fuzzy = true, -- false will only do exact matching
			theme = "ivy",
			sorting_strategy = "ascending",
			layout_strategy = "bottom_pane",
			layout_config = {
				height = 8,
			},
			borderchars = {
				prompt = { "─", " ", " ", " ", "─", "─", " ", " " },
				results = { " " },
				preview = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
			},
			-- width = 0.8,
			previewer = false,
			prompt_prefix = "Symbols> ",
			prompt_title = false,
			results_title = false,
			-- border = false,
			winblend = 20,
			show_line = false,
		},
	},
	undo = {
		fuzzy = true, -- false will only do exact matching
		theme = "ivy",
		sorting_strategy = "ascending",
		layout_strategy = "bottom_pane",
		layout_config = {
			height = 8,
		},
		borderchars = {
			prompt = { "─", " ", " ", " ", "─", "─", " ", " " },
			results = { " " },
			preview = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
		},
		-- width = 0.8,
		previewer = false,
		prompt_prefix = "Symbols> ",
		prompt_title = false,
		results_title = false,
		-- border = false,
		winblend = 20,
		show_line = false,
	},
})

telescope.load_extension("session-lens")
telescope.load_extension("fzf")
telescope.load_extension("project")
telescope.load_extension("undo")
