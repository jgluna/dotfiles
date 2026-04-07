vim.opt.cmdheight = 0
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.expandtab = true
vim.opt.wrap = false
vim.opt.signcolumn = "yes"
vim.opt.backspace = "indent,eol,start"
vim.opt.winborder = "rounded"
vim.opt.undofile = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.swapfile = false
vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.opt.clipboard = "unnamedplus"
vim.opt.number = true
vim.opt.cursorline = true
vim.opt.completeopt = { "menuone", "noselect", "popup", "preview" }
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.lsp.log.set_level(vim.log.levels.WARN)
vim.o.termguicolors = true
vim.o.scrolloff = 10

require("config.lazy")
require("config.keymaps")

require("config.lsp")
require("config.autocmd")
