return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },

	dependencies = {
		"saghen/blink.cmp",
		"williamboman/mason.nvim",
		{
			"williamboman/mason-lspconfig.nvim",
			dependencies = {
				"williamboman/mason.nvim",
			},
		},
	},
	opts = {
		inlay_hints = { enabled = true },
	},

	config = function()
		local lsp = require("lspconfig")
	end,
}
