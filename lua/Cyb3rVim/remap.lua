-- DESCRIPTION: set custom keymaps that are unrelated to plugins in this file
-- NOTE: set the mapleader and local mapleader to <space>
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- NOTE: access vim.keymap.set through keymap variable
local keymap = vim.keymap.set

-- NOTE: open netrw
keymap("n", "<leader>pv", function()
	vim.cmd.Rex()
end)

-- NOTE: yanking to clipboard
-- NOTE: so control c will copy a line or visual selection.
keymap("n", "<C-c>", '"+yy')
keymap("v", "<C-c>", '"+y')
-- NOTE: to copy a paragraph to clipboard use leader+yap
keymap("n", "<leader>yap", '"+yap')
keymap("v", "<leader>yap", '"+yap')

-- NOTE: leave normal mode or visual mode with ctrl+o
keymap("i", "<C-o>", "<Esc>")
keymap("v", "<C-o>", "<Esc>")

-- NOTE: clear search highlights
keymap("n", "<leader>nh", "<CMD>nohl<CR>")

-- NOTE: A keymap that starts the server for godot lsp
keymap("n", "<leader>sg", function()
	vim.fn.serverstart("127.0.0.1:6004")
end, { noremap = true })

vim.keymap.set("n", "<leader>nd", "<cmd>NoiceDismiss<CR>", { desc = "Dismiss Noice Messages" })
