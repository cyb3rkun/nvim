return {
	"romus204/tree-sitter-manager.nvim",
	dependencies = {}, -- tree-sitter CLI must be installed system-wide
	cmd = "TSManager",
	config = function()
		require "tree-sitter-manager".setup({
			ensure_installed = {
				"gdscript",
				"c_sharp",
				"godot_resource",
				"gdshader",
				"lua",
				"vim",
				"vimdoc",
				"json",
				"html",
				"bash",
				"gitignore",
				"c",
				"css",
				"regex",
				"rust",
				"java",
				"yaml"
			},
			border = nil,
			auto_install = true,
			-- Default Options
			-- ensure_installed = {}, -- list of parsers to install at the start of a neovim session
			-- border = nil, -- border style for the window (e.g. "rounded", "single"), if nil, use the default border style defined by 'vim.o.winborder'. See :h 'winborder' for more info.
			-- auto_install = false, -- if enabled, install missing parsers when editing a new file
			-- highlight = true, -- treesitter highlighting is enabled by default
			-- languages = {}, -- override or add new parser sources
			-- parser_dir = vim.fn.stdpath("data") .. "/site/parser",
			-- query_dir = vim.fn.stdpath("data") .. "/site/queries",
		})
	end
}
