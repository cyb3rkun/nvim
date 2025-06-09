return {
	"akinsho/toggleterm.nvim",
	version = "*",
	opts = {},
	config = function()
		local term = require("toggleterm")
		term.setup({
			size = 20, -- Height of the horizontal split (in lines)
			open_mapping = nil, -- We'll define our own keymap
			direction = "horizontal", -- Horizontal split
			shade_terminals = false, -- Slightly darken terminal background
			start_in_insert = false, -- Start in terminal insert mode
			persist_size = true, -- Keep split size consistent
			close_on_exit = false, -- Close terminal when process exits
			float_opts = {
				border = "curved", -- Only relevant if using 'float' direction
			},
			on_open = function(_)
				local manager = require("neo-tree.sources.manager")
				-- local ntree = require("neo-tree")
				local renderer = require("neo-tree.ui.renderer")
				local state = manager.get_state("filesystem")
				local ntree_open = renderer.window_exists(state)
				if ntree_open == true then
					vim.defer_fn(function()
						local cmd = string.format("Neotree toggle")
						print("toggling ntree!")
						vim.notify("toggling ntree", vim.log.levels.TRACE, {})
						vim.cmd(cmd)
						vim.cmd(cmd)
						vim.cmd("wincmd p")

						-- local cmd_retoggle = string.format("Neotree toggle")
						-- vim.cmd(cmd_retoggle)
					end, 100)
				end
			end,
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
