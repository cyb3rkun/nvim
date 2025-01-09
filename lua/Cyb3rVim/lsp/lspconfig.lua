-- KUDOS:
-- YT_CHANNEL: @joseanmartinez
-- GITHUB: @Geerayef/Dotfiles
-- https://github.com/Geerayef/Dotfiles/blob/6dd72f17130a8d5f76b5a919594990c8497cc4b9/.config/nvim/lua/plugins/lsp.lua
return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },

	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		"williamboman/mason.nvim",
		{
			"williamboman/mason-lspconfig.nvim",
			dependencies = { "williamboman/mason.nvim" },
		},

		{ "folke/neodev.nvim", opts = {} },
	},

	config = function()
		local lsp = require("lspconfig")

		local cmp_nvim_lsp = require("cmp_nvim_lsp")

		-- NOTE: Set default capabilities for lsp servers
		local capabilities = vim.tbl_deep_extend(
			"force",
			vim.lsp.protocol.make_client_capabilities(),
			cmp_nvim_lsp.default_capabilities()
		)

		local opts = { noremap = true, silent = true }

		local lsp_attach = function(client, bufnr)
			-- opts.buffer = bufnr

			-- NOTE:  keymaps are defined in lsp_keymaps
			local keymaps = require("Cyb3rVim.lsp.lsp_keymaps")

			keymaps(client, bufnr)

			vim.api.nvim_buf_create_user_command(bufnr, "Format", function()
				vim.lsp.buf.format()
			end, { desc = "Format current buffer with lsp" })
		end

		-- NOTE: Change the Diagnostic symbols in the gutter
		local signs = {
			Error = " ",
			Warn = " ",
			Hint = " ",
			Info = " ",
		}
		for type, icon in pairs(signs) do
			local hl = "DiagnosticSign" .. type
			vim.fn.sign_define(hl, {
				text = icon,
				texthl = hl,
				numhl = "",
			})
		end

		local servers = {
			"lua_ls",
			"gdscript",
			"csharp_ls",
			"bashls",
			"marksman",
			"html",
			"cssls",
			"eslint",
			"biome", -- For JS, TS and other web languages
		}
		-- NOTE: Basic LSP setup
		for index, ls in ipairs(servers) do
			lsp[ls].setup({
				capabilities = capabilities,
				on_attach = lsp_attach,
			})
		end

		-- NOTE: Advanced LSP setups
		lsp.gdshader_lsp.setup({
			capabilities = capabilities,
			on_attach = lsp_attach,
			cmd = { "/home/cyb3rkun/.local/share/gdshader-lsp/gdshader-lsp" },
		})

		lsp.clangd.setup({
			capabilities = capabilities,
			on_attach = lsp_attach,

			filetypes = { "c", "cpp", "objc", "objcpp", "cuda", "proto" },

			root_dir = lsp.util.root_pattern(
				".clang-format",
				".editor-config",
				".compile-commands.json",
				".compile-flags.txt",
				".configure.ac",
				".git",
				"project.godot"
			),
			single_file_support = true,
		})
	end,
}
