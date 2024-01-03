local map = vim.keymap
local opts = { noremap = true, silent = true }

map.set({ 'n', 'v' }, '<Space>', '', {})
vim.g.mapleader = ' '

map.set('n', '<leader>e', vim.cmd.Ex)

map.set('n', '<C-h>', '<C-w>h', opts)
map.set('n', '<C-j>', '<C-w>j', opts)
map.set('n', '<C-k>', '<C-w>k', opts)
map.set('n', '<C-l>', '<C-w>l', opts)
