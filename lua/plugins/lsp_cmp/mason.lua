return {
	"williamboman/mason.nvim",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
	},
	config = function()
		-- NOTE: Import Mason
		local mason = require("mason")

		-- NOTE: Import Mason LSPCONFIG
		local mason_lspconfig = require("mason-lspconfig")

		-- NOTE: Import mason-tool-installer
		local mason_tool_installer = require("mason-tool-installer")

		-- NOTE: Setup Mason Before mason_lspconfig as it is a dependency
		mason.setup({
			ui = {
				icons = {
					package_installed = " ",
					package_pending = " ",
					package_uninstalled = " ",
				},
			},
		})

		-- NOTE: Setup mason LSPCONFIG after mason
		mason_lspconfig.setup({
			automatic_enable = false,
			ensure_installed = {
				"lua_ls",
				"jdtls",
				"gdscript",
				-- "csharp_ls",
				"bashls",
				"marksman",
				"html",
				"cssls",
				"eslint",
				"ruff",
				"clangd",
			},
			automatic_installation = true,
		})

		-- NOTE: mason-tool-installer setup
		mason_tool_installer.setup({
			ensure_installed = {
				-- "clang-format", -- NOTE: Formatter for C C++ OBJC OBJC++ and more
				-- "stylua", -- NOTE: Formatter for Lua
				-- -- NOTE: gd_lint gdscript gdformat GDScript all fail to be acquired automatically
				-- "gdtoolkit",
				-- "prettierd", -- NOTE: Formatter for css html and other web languages?
				-- "rust-analyzer",
			},
		})
	end,
}
