local status,colorizer = pcall(require,"colorizer")
if not status then
    vim.notify("ERROR: colorizer not found!!")
    return
end

colorizer.setup()
