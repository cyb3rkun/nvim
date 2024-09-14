return {
	'nvim-neo-tree/neo-tree.nvim',
	branch = '3.x',
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
		"MunifTanjim/nui.nvim",
	},
	opts = {
		window = {
			position = "left"
		},
	},
	filesystem = {
		filtered_items = {
		hide_dotfiles = false,
		},
		always_show = {
			".env"
		}
	}
}
