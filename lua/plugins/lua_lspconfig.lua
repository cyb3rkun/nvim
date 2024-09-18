return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"lua_ls",
				},
			})
		end,
	},
	{
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-cmdline",
		"hrsh7th/nvim-cmp",
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			local cmp_lsp = require("cmp_nvim_lsp")
			local capabilities = vim.tbl_deep_extend(
				"force",
				{},
				vim.lsp.protocol.make_client_capabilities(),
				cmp_lsp.default_capabilities()
			)
			local lspconfig = require("lspconfig")
			lspconfig.lua_ls.setup({})
			lspconfig.gdscript.setup({ capabilities = capabilities })
			vim.keymap.set("n", "<leader>sg", function()
				vim.fn.serverstart("127.0.0.1:6004")
			end, { noremap = true })

			vim.api.nvim_create_autocmd("lspAttach", {
				group = vim.api.nvim_create_augroup("userLspConfig", {}),
				callback = function(ev)
					vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

					--buffer local mappings.
					--supposedly :help vim.lsp.* for documentation for any of the functions below
					local opts = { buffer = ev.buf }
					vim.keymap.set("n", "gd", vim.lsp.buf.declaration, opts)
					vim.keymap.set({ "n", "v" }, "<space>ca", vim.lsp.buf.code_action, {})
				end,
			})
		end,
	},
}
