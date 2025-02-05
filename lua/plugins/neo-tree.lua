return {
	"nvim-neo-tree/neo-tree.nvim",

	-- NOTE: this is the version of the plugin to use
	version = "3.x",

	-- NOTE: this plugin is loaded on startup and not lazy loaded
	lazy = false,

	-- NOTE: here we define the dependencies
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},

	-- NOTE: in the config function we define some keymaps to work with neotree
	config = function()
		-- NOTE: here we define the options we want for neotree
		require("neo-tree").setup({
			popup_border_style = "rounded",
			enable_git_status = true,
			use_libuv_file_watcher = true,
			window = {
				position = "right",
				width = 30,
				mappings = {
					["y"] = function(state)
						local node = state.tree:get_node()
						local filepath = node:get_id()
						local filename = node.name
						local modify = vim.fn.fnamemodify

						local results = {
							filepath,
							modify(filepath, ":."),
							modify(filepath, ":~"),
							filename,
							modify(filename, ":r"),
							modify(filename, ":e"),
						}

						vim.ui.select({
							"1. Absolute path: " .. results[1],
							"2. Relative Path (CWD): " .. results[2],
							"3. Path relative to HOME: " .. results[3],
							"4. Filename: " .. results[4],
							"5. Filename without extension: " .. results[5],
							"6. Extension of the filename: " .. results[6],
						}, { prompt = "Choose to copy to clipboard:" }, function(choice)
							if choice then
								local i = tonumber(choice:sub(1, 1))
								local result = results[i]
								vim.fn.setreg('"', result)
								vim.notify("Copied: " .. result)
							end
						end)
					end,
				},
			},
		})

		-- NOTE: Keymaps defined here:
		vim.keymap.set("n", "<leader>e", "<cmd> Neotree toggle<CR>")
		vim.keymap.set("n", "<leader>l", "<cmd>Neotree focus<CR>")
	end,
}
