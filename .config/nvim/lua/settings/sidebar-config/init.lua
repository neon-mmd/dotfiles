local status, sidebar = pcall(require, "sidebar-nvim")

if not status then
    vim.notify("ERROR: sidebar-nvim not found!!")
    return
end

sidebar.setup({
    disable_default_keybindings = 0,
    bindings = nil,
    open = false,
    side = "left",
    initial_width = 35,
    hide_statusline = false,
    update_interval = 1000,
    sections = { "files","symbols" },
    section_separator = { "", "-----", "" },
    section_title_separator = { "" },
    symbols = {
        icon = "ƒ",
    },
    files = {
        icon = "",
        show_hidden = true,
        ignored_paths = { "%.git$" },
    },
})
