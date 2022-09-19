local status, telescope = pcall(require, "telescope")
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
        project = {
            fuzzy = true, -- false will only do exact matching
            base_dirs = {
                "/run/media/destruct/39568688-b38c-43ac-a7de-c0f9888ec0c0/git-repos/",
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
            prompt_prefix = "Files> ",
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
            prompt_prefix = "Files> ",
            prompt_title = false,
            results_title = false,
            -- border = false,
            winblend = 20,
            show_line = false,
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
            prompt_prefix = "Files> ",
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
            prompt_prefix = "Files> ",
            prompt_title = false,
            results_title = false,
            -- border = false,
            winblend = 20,
            show_line = false,
        },
    },
})

telescope.load_extension("fzf")
telescope.load_extension("project")
