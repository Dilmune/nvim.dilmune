require "nvchad.options"

local o = vim.o
local opt = vim.opt

o.cursorline = true
o.cursorlineopt = "both"
o.number = true
o.relativenumber = true
o.signcolumn = "yes"
o.scrolloff = 8
o.sidescrolloff = 8
o.termguicolors = true
o.showmode = false
o.cmdheight = 1
o.pumheight = 10
o.splitbelow = true
o.splitright = true

o.expandtab = true
o.shiftwidth = 2
o.tabstop = 2
o.softtabstop = 2
o.smartindent = true
o.wrap = false
o.linebreak = true
o.breakindent = true

o.ignorecase = true
o.smartcase = true
o.hlsearch = true
o.incsearch = true

o.updatetime = 250
o.timeoutlen = 300
o.lazyredraw = false
o.ttyfast = true

o.backup = false
o.writebackup = false
o.swapfile = false
o.undofile = true
o.undodir = vim.fn.stdpath "data" .. "/undo"

o.completeopt = "menuone,noselect"
opt.clipboard = "unnamedplus"

opt.list = true
opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

o.foldmethod = "expr"
o.foldexpr = "nvim_treesitter#foldexpr()"
o.foldlevel = 99
o.foldenable = true

o.mouse = "a"

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
