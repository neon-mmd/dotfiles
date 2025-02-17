local set = vim.opt

set.shell = "/usr/bin/fish"

set.expandtab = true
set.smarttab = true
set.shiftwidth = 4
set.tabstop = 4

set.hlsearch = true
set.incsearch = true
set.ignorecase = true
set.smartcase = true

set.termguicolors = true
set.showmode = false
set.splitbelow = true
set.splitright = true
set.wrap = true
set.breakindent = true
set.scrolloff = 5
set.fileencoding = "utf-8"
set.conceallevel = 2
set.ttyfast = true

set.number = true
set.relativenumber = false
set.cursorline = true
set.wildmenu = true
set.completeopt = "menuone,noselect"

set.hidden = true
set.mouse = "a"

set.autoindent = true
set.filetype.indent = false

set.clipboard = "unnamedplus"
set.laststatus = 3

set.list = true
-- set.listchars:append("space:⋅")
set.listchars:append("eol:⤶")

set.foldmethod = "expr"
set.foldexpr = "nvim_treesitter#foldexpr()"

set.signcolumn = "yes"

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.g.nvim_ghost_autostart = 0
