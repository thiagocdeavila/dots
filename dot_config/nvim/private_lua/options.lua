vim.cmd('autocmd!')

local opt = vim.opt
local global = vim.g

opt.showmode = false -- Dont show mode
opt.number = true
opt.relativenumber = true
opt.autoindent = true
opt.smartindent = true
opt.cmdheight = 1
opt.laststatus = 3
opt.expandtab = true
opt.scrolloff = 4
opt.shiftwidth = 2
opt.tabstop = 2
opt.wrap = false
opt.signcolumn = "yes"

opt.mouse = ''

opt.swapfile = false
opt.backup = false
opt.undofile = true

opt.termguicolors = true

global.netrw_banner = 0
