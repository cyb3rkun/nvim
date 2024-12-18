return {
	"nvim-treesitter/nvim-treesitter",

	event = { "BufReadPre", "BufNewFile" },
	build = ":TSUpdate",

	dependencies = {
		"nvim-treesitter/nvim-treesitter-textobjects",
		"windwp/nvim-ts-autotag",
	},

	config = function()
		local treesitter = require("nvim-treesitter.configs")
		treesitter.setup({
			modules = {},
			sync_install = false,
			auto_install = true,
			ignore_install = {},

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
			},

			highlight = {
				enable = true,
				additional_vim_regex_highlighting = { "markdown" },
			},

			indent = {
				enable = true,
			},

			autotag = {
				enable = true,
			},

			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = "<M-space>",
					node_incremental = "<M-space>",
					scope_incremental = false,
					node_decremental = "<bs>",
				},
			},
		})
	end,
}
