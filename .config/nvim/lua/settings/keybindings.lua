local bind = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

bind("", ";", "<Nop>", opts)
vim.g.mapleader = ";"

-- window resizing
bind("n", "<C-Up>", ":resize -2<CR>", opts)
bind("n", "<C-Down>", ":resize +2<CR>", opts)
bind("n", "<C-Left>", ":vertical resize -2<CR>", opts)
bind("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- insert
bind("i", "jk", "<ESC>", opts)
