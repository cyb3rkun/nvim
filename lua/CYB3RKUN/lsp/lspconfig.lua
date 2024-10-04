return {

	"neovim/nvim-lspconfig",
	dependencies = {
		"hrsh7th/nvim-cmp",
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-cmdline",
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
	},

	config = function()
		--import lspconfig plugin
		local lspconfig = require("lspconfig")
		-- import cmp-nvim-lsp
		local cmp_nvim_lsp = require("cmp_nvim_lsp")

		-- use to enable autocompletion (assign to every lsp config)
		local capabilities = vim.tbl_deep_extend(
			"force",
			{},
			vim.lsp.protocol.make_client_capabilities(),
			cmp_nvim_lsp.default_capabilities()
		)

		local opts = { noremap = true, silent = true }

		--keybinds defined in lsp_keymaps.lua
		local lsp_attach = function(client, bufnr)
			--set the options.buffer to the currently open buffer?
			opts.buffer = bufnr
			--get the keymaps from lsp_keymaps.lua and assign them to variable "keymaps"
			local keymaps = require('CYB3RKUN.lsp.lsp_keymaps')
			--call the keymaps function from lsp_keymaps.lua
			keymaps(client, bufnr)
			--set formatting
			vim.api.nvim_buf_create_user_command(bufnr, "Format", function()
				vim.lsp.buf.format()
			end, { desc = "Format current buffer with lsp" })
		end

		-- Change the Diagnostic symbols in the gutter
		local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
		for type, icon in pairs(signs) do
			local hl = "DiagnosticSign" .. type
			vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
		end

		-- Configure LSP servers --
		-- Lua Language server
		lspconfig.lua_ls.setup({
			capabilities = capabilities,
			on_attach = lsp_attach,
		})

		-- Clang Server
		lspconfig.clangd.setup({
			on_attach = lsp_attach,
			capabilities = capabilities,
			cmd = { "/home/cyb3rkun/.local/share/nvim/mason/bin/clangd" },
			filetypes = { "c", "cpp", "objc", "objcpp", "cuda", "proto" },
			root_dir = lspconfig.util.root_pattern(
				'.clang-format',
				'.editor-config',
				'.compile-commands.json',
				'.compile-flags.txt',
				'.configure.ac',
				'.git'
			),
			single_file_support = true,
		})
	end,
}
