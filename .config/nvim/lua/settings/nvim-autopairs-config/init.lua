local status,autopairs = pcall(require,"nvim-autopairs")
if not status then
    vim.notify("ERROR: nvim-autopairs not found!!")
    return
end

autopairs.setup {}
