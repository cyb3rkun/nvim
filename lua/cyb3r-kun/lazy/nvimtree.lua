return {
	"nvim-tree/nvim-tree.lua",
	version = "3.x",
	lazy = false,
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		require("nvim-tree").setup {--nvim-tree specific settings go here
			filters = {
				dotfiles = true,
			}
		}
		vim.keymap.set('n', '<leader>t', '<Cmd>NvimTreeToggle<CR>')
		vim.keymap.set('i', '<C-t>', '<Cmd>NvimTreeToggle<CR>')
		vim.keymap.set('n', '<leader>l', '<Cmd>NvimTreeFocus<CR>')
		vim.keymap.set('i', '<C-l>', '<Cmd>NvimTreeFocus<CR>')
	end
}

