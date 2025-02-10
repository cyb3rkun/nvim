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
				-- note: there is no need to specifically add them
				-- here if you set them up in formatting and
				-- lspconfig.
				-- this is mainly just for gdscript

				-- null_ls.builtins.formatting.gdformat,
				-- null_ls.builtins.formatting.stylua,
				-- null_ls.builtins.diagnostics.gdlint,

				-- NOTE: THIS Has to be here to get c# formatting
				-- the same as I have it in c++ and C
				-- You can still Use <leader>mp to format it
				-- but <leader>gf seems to be a bit faster
				-- null_ls.builtins.lsp
				-- null_ls.builtins.lsp.biome,
				null_ls.builtins.formatting.clang_format,
				-- null_ls.builtins.formatting.prettier.withd({
				-- 	extra_args = {
				-- 		"--print-width", "80",
				-- 		"--tab-width", "4",
				-- 		"--use-tabs",
				-- 		"--trailing-comma", "all",
				-- 	}
				-- }),
			},
		})
		vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
	end,
}
