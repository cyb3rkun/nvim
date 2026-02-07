-- NOTE: access vim.keymap.set through keymap variable

-- yanking to clipboard
Keymap("n", "<C-c>", '"+y')
Keymap("v", "<C-c>", '"+y')

-- NOTE: clear search highlights
Keymap("n", "<leader>nh", vim.cmd.nohl)

-- NOTE: A keymap that starts the server for godot LSP and DAP
Keymap("n", "<leader>sg", function()
	vim.fn.serverstart("./godothost")
end, { noremap = true })

Keymap("n", "<leader>nd", "<cmd>NoiceDismiss<CR>", { desc = "Dismiss Noice Messages" })

Keymap("n", "<C-P>", "<cmd>execute 'move .-' . (v:count1 + 1)<cr>==", { desc = "Normal Mode: Move Up" })
Keymap("n", "<C-N>", "<cmd>execute 'move .+' . v:count1<cr>==", { desc = "Normal Mode: Move Down" })
Keymap("i", "<M-K>", "<esc><cmd>m .-2<cr>==gi", { desc = "Insert Mode: Move Up" })
Keymap("i", "<M-J>", "<esc><cmd>m .+1<cr>==gi", { desc = "Insert Mode: Move Down" })
Keymap("v", "K", ":<C-u>execute \"'<,'>move '<-\" . (v:count1 + 1)<cr>gv=gv", { desc = "Visual Mode: Move Up" })
Keymap("v", "J", ":<C-u>execute \"'<,'>move '>+\" . v:count1<cr>gv=gv", { desc = "Visual Mode: Move Down" })

Keymap("n", "<leader>sl", function()
	local current = vim.diagnostic.config().virtual_lines
	vim.diagnostic.config({
		virtual_lines = not current,
	})
end, { desc = "toggle virtual lines for Diagnostics" })

Keymap("n", "<leader>i", function ()
	vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
end, {desc = "Toggle Inlay Hints"})
