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
		{
			-- "folke/neodev.nvim",
			-- opts = {}
		},
	},
	opts = {
		servers = {
			lua_ls = {},
		},
	},

	config = function()
		local lsp = require("lspconfig")

		-- local cmp_nvim_lsp = require("cmp_nvim_lsp")

		-- NOTE: Set default capabilities for lsp servers
		-- local capabilities = vim.tbl_deep_extend(
		-- 	"force",
		-- 	vim.lsp.protocol.make_client_capabilities(),
		-- 	cmp_nvim_lsp.default_capabilities()
		-- )
		---@diagnostic disable-next-line: undefined-global
		local capabilities = require("blink.cmp").get_lsp_capabilities(capabilities)

		---@diagnostic disable-next-line: unused-local
		local opts = { noremap = true, silent = true }

		local lsp_attach = function(client, bufnr)
			---@diagnostic disable-next-line: unused-local
			opts.buffer = bufnr

			-- NOTE:  keymaps are defined in lsp_keymaps

			local keymaps = require("config.lsp_mappings")
			-- local keymaps = require("Cyb3rVim.lsp.lsp_keymaps")
			--
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
			"jdtls",
			"gdscript",
			"csharp_ls",
			"bashls",
			"marksman",
			"html",
			"cssls",
			"eslint",
			"ruff",
			"buff",
			-- "black"
			-- "pylsp",
			-- "biome", -- For JS, TS and other web languages
			-- "neorg-interim-ls",
		}

		-- NOTE: Basic LSP setup
		for _, ls in ipairs(servers) do
			lsp[ls].setup({
				capabilities = capabilities,
				on_attach = lsp_attach,
			})
		end

		lsp.pylsp.setup({
			settings = {
				pylsp = {
					plugins = {
						pyflakes = { enabled = false },
						pycodestyle = { enabled = false },
						autopep8 = { enabled = false },
						yapf = { enabled = false },
						mccabe = { enabled = false },
						pylsp_mypy = { enabled = false },
						pylsp_black = { enabled = false },
						pylsp_isort = { enabled = false },
					},
				},
			},

		})
		lsp.biome.setup({
			on_attach = lsp_attach,
			capabilities = capabilities,
			filetypes = { "js", "ts", "json"}
		})

		lsp.rust_analyzer.setup({
			on_attach = lsp_attach,
			capabilities = capabilities,
			filetypes = { "rust" },
			root_dir = lsp.util.root_pattern("Cargo.toml"),
			settings = {
				cargo = {
					allFeatures = true,
				},
			},
		})

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
