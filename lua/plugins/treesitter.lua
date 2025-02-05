return {
	{
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
					"regex",
					"norg",
					"rust"
				},

				highlight = {
					enable = true,
					additional_vim_regex_highlighting = { "markdown" },
				},

				indent = {
					enable = true,
					-- disable = true,
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
	},
	{
		"nvim-treesitter/nvim-treesitter-textobjects",
		lazy = true,
		config = function()
			require("nvim-treesitter.configs").setup({
				textobjects = {
					select = {
						enable = true,
						-- Automatically jump to next Textobj
						lookahead = true,

						keymaps = {
							["a="] = {
								query = "@assignment.outer",
								desc = "Select Around assignment",
							},
							["i="] = {
								query = "@assignment.inner",
								desc = "Select Inside assignment",
							},
							["L="] = {
								query = "@assignment.lhs",
								desc = "Select left hand side of an assignment",
							},
							["R="] = {
								query = "@assignment.rhs",
								desc = "Select right hand side of an assignment",
							},

							["aa"] = {
								query = "@parameter.outer",
								desc = "Select Around parameter",
							},
							["ia"] = {
								query = "@parameter.inner",
								desc = "Select Inside parameter",
							},

							["ai"] = {
								query = "@conditional.outer",
								desc = "Select Around conditional",
							},
							["ii"] = {
								query = "@conditional.inner",
								desc = "Select Inside conditional",
							},

							["al"] = {
								query = "@loop.outer",
								desc = "Select Around loop",
							},
							["il"] = {
								query = "@loop.inner",
								desc = "Select Inside loop",
							},

							["af"] = {
								query = "@call.outer",
								desc = "Select Around function call",
							},
							["if"] = {
								query = "@call.inner",
								desc = "Select Inside function call",
							},

							["am"] = {
								query = "@function.outer",
								desc = "Select Around function",
							},
							["im"] = {
								query = "@function.inner",
								desc = "Select Inside function",
							},

							["ac"] = {
								query = "@class.outer",
								desc = "Select around class",
							},
							["ic"] = {
								query = "@class.inner",
								desc = "Select inside class",
							},

							["ag"] = {
								query = "@comment.outer",
								desc = "Select around comment",
							},

							["as"] = {
								query = "@statement.outer",
								desc = "Select Around Statement",
							},
						},
					},
				},
			})
		end,
	}
}
