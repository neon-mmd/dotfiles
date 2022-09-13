local status,telescope = pcall(require,"telescope")
if not status then
    vim.notify("ERROR: telescope not found!!")
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
		},
		project = {
			base_dirs = {
				"/run/media/destruct/39568688-b38c-43ac-a7de-c0f9888ec0c0/git-repos/",
			},
			hidden_files = true, -- default: false
			theme = "dropdown",
		},
	},
	pickers = {
		find_files = {
			theme = "ivy",
		},
		live_grep = {
			theme = "ivy",
		},
		diagnostics = {
			theme = "ivy",
		},
	},
})

telescope.load_extension("fzf")
telescope.load_extension("project")
