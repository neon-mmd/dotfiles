require("telescope").load_extension("project")
require("telescope").setup({
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
    extensions = {
        project = {
            base_dirs = {
                "/run/media/destruct/39568688-b38c-43ac-a7de-c0f9888ec0c0/git-repos/",
            },
            hidden_files = true, -- default: false
            theme = "dropdown",
        },
    },
})
