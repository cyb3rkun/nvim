vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.keymap.set('n', '<leader>pv', vim.cmd.Rex)

--yanking to clipboard
vim.keymap.set('n', '<leader>y', '\"+y')
vim.keymap.set('v', '<leader>y', '\"+y')
vim.keymap.set('n', '<leader>yap', '\"+yap')
vim.keymap.set('v', '<leader>yap', '\"+yap')

vim.keymap.set('i', '<C-c>', '<Esc>')

vim.keymap.set('n', '<leader>g', ':LazyGit<CR>')

--Neotree remaps
vim.keymap.set('n', '<leader>nt>', 'Neotree toggle')
