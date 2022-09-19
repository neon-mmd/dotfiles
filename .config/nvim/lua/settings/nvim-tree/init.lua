local status, tree = pcall(require, "nvim-tree")
if not status then
    vim.notify("ERROR: nvim-tree not found!!")
    return
end

tree.setup({
    sort_by = "case_sensitive",
    view = {
        adaptive_size = true,
        mappings = {
            list = {
                { key = "u", action = "dir_up" },
            },
        },
    },
    renderer = {
        group_empty = true,
    },
    filters = {
        dotfiles = true,
    },
})
