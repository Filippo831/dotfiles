vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.errorbells = false

vim.opt.iskeyword:remove("_")

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = vim.fn.expand("~/.vim/undodir")
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.g.netrw_banner = 1

-- Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
-- delays and poor user experience.
vim.opt.updatetime = 50

-- Don't pass messages to |ins-completion-menu|.
vim.opt.shortmess:append("c")

vim.opt.colorcolumn = "80"

vim.g.mapleader = " "

-- set spell on
vim.o.spell = false

-- global status line
vim.o.laststatus = 3

-- search not case sensitive
vim.opt.smartcase = true
vim.opt.ignorecase = true

-- setting to make obsidian work
vim.opt_local.conceallevel = 2
