return {
	"mason-org/mason.nvim",
	dependencies = {
		"mason-org/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
	},
	opts = {},
	config = function()
		-- NOTE: Import Mason
		local mason = require "mason"



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

		-- NOTE: Import Mason LSPCONFIG
		local mason_lspconfig = require "mason-lspconfig"
		mason_lspconfig.setup({
			automatic_enable = false,
			ensure_installed = {
				"lua_ls",
				"jdtls",
				-- "gdtoolkit",
				"bashls",
				"marksman",
				"html",
				"cssls",
				"eslint",
				"ruff",
				"clangd",
				"omnisharp",
				"pylsp",
				"biome", -- For JS, TS and other web languages
				"qmlls"
			},
			automatic_installation = true,
		})

		-- NOTE: Import mason-tool-installer
		local mason_tool_installer = require "mason-tool-installer"
		mason_tool_installer.setup({
			automatic_enable = false,
			ensure_installed = {
				-- "clang-format", -- NOTE: Formatter for C C++ OBJC OBJC++ and more
				-- "stylua", -- NOTE: Formatter for Lua
				-- -- NOTE: gd_lint gdscript gdformat GDScript all fail to be acquired automatically
				"gdtoolkit",
				-- "prettierd", -- NOTE: Formatter for css html and other web languages?
				-- "rust-analyzer",
			},
		})
	end,
}

