return {
	"folke/noice.nvim",
	event = "VeryLazy",
	opts = {
		messages = {
			enabled = true,
		},
	},
	dependencies = {
		"MunifTanjim/nui.nvim",
		{
			"rcarriga/nvim-notify",
			config = function()
				require("notify").setup({
					enabled = true,
					timeout = 50,
				})
			end,
		},
	},
}
