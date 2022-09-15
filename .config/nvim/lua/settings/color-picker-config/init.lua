local status, ccc = pcall(require, "ccc")
if not status then
    vim.notify("ERROR: ccc.nvim not found!!")
    return
end

local mapping = ccc.mapping
ccc.setup({})
