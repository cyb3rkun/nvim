return {
	"folke/todo-comments.nvim",
	event = { "BufReadPre", "BufNewFile", "BufEnter" },
	dependencies = { "nvim-lua/plenary.nvim" },

	opts = {
		signs = true,
		sign_priority = 8,
		keywords = {
			NOTE = { icon = "", color = "#4c6850", alt = { "INFO" } },
		}
	},
}
