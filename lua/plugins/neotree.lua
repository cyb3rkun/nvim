-- DESC: here we load the neotree plugin for convenient file browsing capabilities
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
			window = {
				position = "left",
				width = 30,
			},
		})

		-- NOTE: Keymaps defined here:
		vim.keymap.set("n", "<leader>t", ":Neotree toggle<CR>")
		vim.keymap.set("n", "<leader>l", ":Neotree focus<CR>")
	end,
}
