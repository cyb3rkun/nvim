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
		inlay_hints = { enabled = true },
	},

	config = function()
		local lsp = require("lspconfig")

		-- NOTE: Set default capabilities for lsp servers
		-- local capabilities = vim.tbl_deep_extend(
		-- 	"force",
		-- 	vim.lsp.protocol.make_client_capabilities(),
		-- 	cmp_nvim_lsp.default_capabilities()
		-- )
		--
		---@diagnostic disable-next-line: undefined-global
		-- local capabilities = require("blink.cmp").get_lsp_capabilities(capabilities)
		--
		-- ---@diagnostic disable-next-line: unused-local
		-- local opts = { noremap = true, silent = true }
		--
		-- vim.api.nvim_create_autocmd("LspAttach", {
		-- 	callback = function(ev)
		-- 		local bufnr = ev.buf
		-- 		local client = vim.lsp.get_client_by_id(ev.data.client_id)
		--
		-- 		local keymaps = require("config.lsp_mappings")
		-- 		keymaps(client, bufnr)
		--
		-- 		-- if client.server_capabilities.inlayHintProvider then
		-- 		-- 	vim.lsp.inlay_hint.enable(true)
		-- 		-- end
		--
		-- 		vim.api.nvim_buf_create_user_command(bufnr, "Format", function()
		-- 			vim.lsp.buf.format()
		-- 		end, { desc = "Format current buffer with lsp" })
		-- 	end,
		-- })
		-- local lsp_attach = function(client, bufnr)
		-- 	---@diagnostic disable-next-line: unused-local
		-- 	opts.buffer = bufnr
		--
		-- 	-- NOTE:  keymaps are defined in lsp_keymaps
		--
		-- 	local keymaps = require("config.lsp_mappings")
		-- 	-- local keymaps = require("Cyb3rVim.lsp.lsp_keymaps")
		-- 	--
		-- 	keymaps(client, bufnr)
		--
		-- 	vim.api.nvim_buf_create_user_command(bufnr, "Format", function()
		-- 		vim.lsp.buf.format()
		-- 	end, { desc = "Format current buffer with lsp" })
		-- end

		-- NOTE: Change the Diagnostic symbols in the gutter

		-- local servers = {
		-- 	-- "lua_ls",
		-- 	"jdtls",
		-- 	"gdscript",
		-- 	-- "csharp_ls",
		-- 	"bashls",
		-- 	"marksman",
		-- 	"html",
		-- 	"cssls",
		-- 	"eslint",
		-- 	"ruff",
		-- 	"omnisharp",
		-- 	"gopls",
		-- 	"fish_lsp",
		-- 	-- "rnix",
		-- 	"nil_ls"
		-- 	-- "bacon-ls"
		-- 	-- "buf",
		-- 	-- "black"
		-- 	-- "pylsp",
		-- 	-- "biome", -- For JS, TS and other web languages
		-- 	-- "neorg-interim-ls",
		-- }


		-- NOTE: Basic LSP setup
		-- for _, ls in ipairs(servers) do
		-- 	lsp[ls].setup({
		-- 		capabilities = capabilities,
		-- 		-- on_attach = lsp_attach,
		-- 	})
		-- end

		-- lsp.gdscript.setup({capabilities = vim.lsp.protocol.make_client_capabilities()})

		
		-- lsp.bacon_ls.setup({
		-- 	init_options = {
		-- 		updateOnSave = true,
		-- 		updateOnSaveWaitMillis = 1000,
		-- 	},
		-- })
		-- lsp.pylsp.setup({
		-- 	settings = {
		-- 		pylsp = {
		-- 			plugins = {
		-- 				pyflakes = { enabled = false },
		-- 				pycodestyle = { enabled = false },
		-- 				autopep8 = { enabled = false },
		-- 				yapf = { enabled = false },
		-- 				mccabe = { enabled = false },
		-- 				pylsp_mypy = { enabled = false },
		-- 				pylsp_black = { enabled = false },
		-- 				pylsp_isort = { enabled = false },
		-- 			},
		-- 		},
		-- 	},
		-- })
		-- lsp.biome.setup({
		-- 	-- on_attach = lsp_attach,
		-- 	capabilities = capabilities,
		-- 	filetypes = { "js", "ts", "json" },
		-- })

		-- lsp.rust_analyzer.setup({
		-- 	-- on_attach = lsp_attach,
		-- 	capabilities = capabilities,
		-- 	filetypes = { "rust" },
		-- 	-- update_in_insert = true,
		-- 	settings = {
		-- 		["rust-analyzer"] = {
		-- 			cargo = {
		-- 				allFeatures = true,
		-- 			},
		-- 			diagnostics = {
		-- 				enabled = true,
		-- 				experimental = {
		-- 					enabled = true,
		-- 				},
		-- 			},
		-- 		},
		-- 	},
		-- })

		-- lsp.ast_grep.setup({
		-- 	-- these are the default options, you only need to specify
		-- 	-- options you'd like to change from the default
		-- 	cmd = { "ast-grep", "lsp" },
		-- 	filetypes = {
		-- 		"c",
		-- 		"cpp",
		-- 		"rust",
		-- 		"go",
		-- 		"java",
		-- 		"python",
		-- 		"javascript",
		-- 		"typescript",
		-- 		"html",
		-- 		"css",
		-- 		"kotlin",
		-- 		"dart",
		-- 		"lua",
		-- 	},
		-- 	root_dir = require("lspconfig.util").root_pattern("sgconfig.yaml", "sgconfig.yml"),
		-- })
		-- -- NOTE: Advanced LSP setups
		-- lsp.gdshader_lsp.setup({
		-- 	capabilities = capabilities,
		-- 	-- on_attach = lsp_attach,
		-- 	cmd = { "/home/cyb3rkun/.local/share/gdshader-lsp/gdshader-lsp" },
		-- })

		
	end,
}
