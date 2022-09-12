local status, notify = pcall(require, "notify")

if not status then
    vim.notify("ERROR: notify not found!!")
    return
end

notify.setup({
    background_color = "#000000",
})
