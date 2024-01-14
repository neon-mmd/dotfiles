local status, gitsigns = pcall(require, "gitsigns")
if not status then
    vim.notify("ERROR: gitsigns not found!!")
    return
end

gitsigns.setup()
