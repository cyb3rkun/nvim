vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.keymap.set('n', '<leader>pv', vim.cmd.Rex)

--yanking to clipboard
vim.keymap.set('n', '<leader>y', '\"+y')
vim.keymap.set('v', '<leader>y', '\"+y')
vim.keymap.set('n', '<leader>yap', '\"+yap')
vim.keymap.set('v', '<leader>yap', '\"+yap')

vim.keymap.set('i', '<C-o>', '<Esc>')
vim.keymap.set('v', '<C-o>', '<Esc>')


