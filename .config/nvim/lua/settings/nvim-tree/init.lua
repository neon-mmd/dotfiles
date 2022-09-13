local status,tree = pcall(require,"nvim-tree")
if not status then
    vim.notify("ERROR: nvim-tree not found!!")
    return
end

tree.setup()
