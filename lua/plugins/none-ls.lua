return {
	"nvimtools/none-ls.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	config = function()
		local null_ls = require("null-ls")
		null_ls.setup({
			sources = {
				-- add linters and formatters and diagnostics here
				-- a full list of supported languages for none-ls can be found on their github
				-- null_ls.builtins.formatting.stylua,
				--
				-- NOTE: there is no need to specifically add them
				-- here if you set them up in formatting and
				-- lspconfig.
				-- This is mainly just for gdscript
				null_ls.builtins.formatting.gdformat,
				null_ls.builtins.diagnostics.gdlint,
			},
		})
		vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
	end,
}
