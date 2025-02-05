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
keymap("i", "<C-o>", "<Esc>", {desc = "Leave Insert Mode"})
keymap("v", "<C-o>", "<Esc>", {desc = "Leave Insert Mode"})

-- NOTE: clear search highlights
keymap("n", "<leader>nh", vim.cmd.nohl)

-- NOTE: A keymap that starts the server for godot LSP and DAP
keymap("n", "<leader>sg", function()
	vim.fn.serverstart("127.0.0.1:6004")
end, { noremap = true })

keymap("n", "<leader>nd", "<cmd>NoiceDismiss<CR>", { desc = "Dismiss Noice Messages" })

-- NOTE: Move visual selection up or down
-- keymap("v", "J", ":m '>+1<CR>gv=gv")
-- keymap("v", "K", ":m '<-2<CR>gv=gv")

keymap("n", "<M-K>", "<cmd>execute 'move .-' . (v:count1 + 1)<cr>==", { desc = "Move Up" })
keymap("n", "<M-J>", "<cmd>execute 'move .+' . v:count1<cr>==", { desc = "Move Down" })
keymap("i", "<M-K>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move Up" })
keymap("i", "<M-J>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move Down" })
-- keymap("v", "<K>", ":<C-u>execute \"'<,'>move '<-\" . (v:count1 + 1)<cr>gv=gv", { desc = "Move Up" })
-- keymap("v", "<J>", ":<C-u>execute \"'<,'>move '>+\" . v:count1<cr>gv=gv", { desc = "Move Down" })

