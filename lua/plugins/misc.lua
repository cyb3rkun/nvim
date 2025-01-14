-- plugin for rust
return {
	--[[ {
		'mrcjkb/rustaceanvim',
		version = '^5',
		lazy = false
	}, ]]
	
	--[[ {
		"simrat39/rust-tools.nvim",
		dependencies = {
			"neovim/nvim-lspconfig",
		},
		ft = "rust",
		opts = {
			server = {
				on_attach = require("Cyb3rVim.lsp.lspconfig").on_attach,
				capabilities = require("Cyb3rVim.lsp.lspconfig").capabilities,
			-- local keymaps = require("Cyb3rVim.lsp.lsp_keymaps")
			},
		},
	}, ]]
}
