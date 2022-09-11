require("nvim-treesitter.configs").setup({
    ensure_installed = maintained,
    sync_install = false,
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = true,
        indent = true,
    },
    refactor = {
        highlight_definitions = {
            enable = true,
            clear_on_cursor_move = true,
        },
        smart_rename = {
            enable = true,
            keymaps = {
                smart_rename = "grr",
            },
        },
    },
    rainbow = {
        enable = true,
        extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
        max_file_lines = nil, -- Do not enable for files with more than n lines, int
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
})
