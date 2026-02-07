return {
	"akinsho/toggleterm.nvim",
	version = "*",
	opts = {},
	config = function()
		local term = require("toggleterm")
		term.setup({
			size = 12, -- Height of the horizontal split (in lines)
			open_mapping = nil, -- We'll define our own keymap
			direction = "horizontal", -- Horizontal split
			shade_terminals = false, -- Slightly darken terminal background
			start_in_insert = false, -- Start in terminal insert mode
			persist_size = true, -- Keep split size consistent
			close_on_exit = false, -- Close terminal when process exits
			float_opts = {
				border = "curved", -- Only relevant if using 'float' direction
			},
		})

		vim.keymap.set("n", "<localleader>t", function()
			term.toggle()
		end)
		-- Optional: Exit terminal mode with <Esc>
		vim.keymap.set("t", "<Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

		Term = require("toggleterm.terminal").Terminal
		Lazygit = Term:new({
			cmd = "lazygit",
			hidden = true,
			direction = "float",
			start_in_insert_mode = true,
			on_open = function() end,
		})
		vim.keymap.set("n", "<localleader>lt", function()
			Lazygit:toggle()
		end)
		-- vim.api.nvim_create_user_command("Lazygit", function()
		-- 	lazygit:toggle()
		-- end, {})
	end,
}
