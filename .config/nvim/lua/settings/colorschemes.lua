local colorscheme = 'doom-dark+'

local status,_ = pcall(vim.cmd, 'colorscheme ' .. colorscheme)

if not status then
    vim.notify("ERROR: " .. colorscheme .. " colorscheme not found!")
    return
end
