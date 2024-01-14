local status,luasnip = pcall(require,"luasnip.loaders.from_vscode")
if not status then
    vim.notify("ERROR: luasnip not found!!")
    return
end

luasnip.lazy_load()
