local bind = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

bind("", ";", "<Nop>", opts)
vim.g.mapleader = ";"

-- buffer mappings
bind("n", "<A-,>", ":BufferPrevious<CR>", opts)
bind("n", "<A-.>", ":BufferNext<CR>", opts)
bind("n", "<A-<>", ":BufferMovePrevious<CR>", opts)
bind("n", "<A->>", ":BufferMoveNext<CR>", opts)
bind("n", "<A-1>", ":BufferGoto 1<CR>", opts)
bind("n", "<A-2>", ":BufferGoto 2<CR>", opts)
bind("n", "<A-3>", ":BufferGoto 3<CR>", opts)
bind("n", "<A-4>", ":BufferGoto 4<CR>", opts)
bind("n", "<A-5>", ":BufferGoto 5<CR>", opts)
bind("n", "<A-6>", ":BufferGoto 6<CR>", opts)
bind("n", "<A-7>", ":BufferGoto 7<CR>", opts)
bind("n", "<A-8>", ":BufferGoto 8<CR>", opts)
bind("n", "<A-9>", ":BufferGoto 9<CR>", opts)
bind("n", "<A-0>", ":BufferLast<CR>", opts)
bind("n", "<A-c>", ":BufferClose<CR>", opts)
bind("n", "<C-p>", ":BufferPick<CR>", opts)

-- window resizing
bind("n", "<C-Up>", ":resize -2<CR>", opts)
bind("n", "<C-Down>", ":resize +2<CR>", opts)
bind("n", "<C-Left>", ":vertical resize -2<CR>", opts)
bind("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- insert
bind("i", "jk", "<ESC>", opts)
