return {
	"nvim-neo-tree/neo-tree.nvim",
	version = "3.x",
	lazy = false,
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	opts = {
		window = {
			powition = "left"
		},
	},
	config = function ()
		vim.keymap.set('n', '<leader>t', ':Neotree toggle<CR>')
		vim.keymap.set('n', '<leader>l', ':Neotree focus<CR>')
	end
}
