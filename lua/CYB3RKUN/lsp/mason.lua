return {
	"williamboman/mason.nvim",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
	},
	config = function()
		local mason = require("mason")
		-- Setup Mason
		mason.setup({})
		-- Mason LspConfig Setup
		local mason_lspconfig = require("mason-lspconfig")
		mason_lspconfig.setup({
			ensure_installed = {
				"clangd",
				"lua_ls"
			},
			automatic_installation = true,
		})
	end,
}
