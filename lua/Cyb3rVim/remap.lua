-- DESCRIPTION: set custom keymaps that are unrelated to plugins in this file
-- NOTE: set the mapleader and local mapleader to <space>
vim.g.mapleader = " "
vim.g.maplocalleader = "."

-- NOTE: access vim.keymap.set through keymap variable
local keymap = vim.keymap.set

-- NOTE: yanking to clipboard
-- NOTE: CTRL+c+<motion> or copy visual selection.
keymap("n", "<C-c>", '"+y')
keymap("v", "<C-c>", '"+y')

-- NOTE: leave normal mode or visual mode with ctrl+o
keymap("i", "<C-o>", "<Esc>")
keymap("v", "<C-o>", "<Esc>")

-- NOTE: clear search highlights
keymap("n", "<leader>nh", vim.cmd.nohl)

-- NOTE: A keymap that starts the server for godot LSP and DAP
keymap("n", "<leader>sg", function()
	vim.fn.serverstart("127.0.0.1:6004")
end, { noremap = true })

keymap("n", "<leader>nd", "<cmd>NoiceDismiss<CR>", { desc = "Dismiss Noice Messages" })

-- NOTE: Move visual selection up or down
keymap("v", "J", ":m '>+1<CR>gv=gv")
keymap("v", "K", ":m '<-2<CR>gv=gv")
