return {
	{
		"nvim-treesitter/nvim-treesitter",

		event = { "BufReadPre", "BufNewFile" },
		build = ":TSUpdate",
		branch = "master",

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
					"rust",
					"java",
					"yaml"
				},

				highlight = {
					enable = true,
					additional_vim_regex_highlighting = { "markdown" },
				},

				indent = {
					enable = true,
					-- disable = true,
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
		"windwp/nvim-ts-autotag",
		event = "VeryLazy",
		config = function()
			---@diagnostic disable-next-line: missing-fields
			require("nvim-ts-autotag").setup({
				opts = {
					enable_close = true,
					enable_rename = true,
					enable_close_on_slash = true,
				},
			})
		end,
	},
	{
		"nvim-mini/mini.ai",
		version = "*",
		dependencies = {
			"nvim-treesitter/nvim-treesitter-textobjects",
		},
		config = function()
			local ts_spec = require("mini.ai").gen_spec.treesitter
			require("mini.ai").setup({
				mappings = {
					around = "a",
					inside = "i",

					--next / last
					around_next = "an",
					inside_next = "in",
					around_last = "al",
					inside_last = "il",

					goto_left = "g[",
					goto_right = "g]",
				},

				custom_textobjects = {
					r = ts_spec({
						a = "@attribute.outer",
						i = "@attribute.inner",
					}),
					m = ts_spec({
						a = "@function.outer",
						i = "@function.inner",
					}),
					o = ts_spec({
						a = { "@conditional.outer", "@loop.outer" },
						i = { "@conditional.inner", "@loop.inner" },
					}),
					a = ts_spec({
						a = { "@parameter.outer", "@argument.outer" },
						i = { "@parameter.inner", "@argument.inner" },
					}),
					k = ts_spec({
						a = { "@block.outer" },
						i = { "@block.inner" }
					}),
					-- don't know if this works ...
					["="] = ts_spec({
						a = { "@assignment.outer" },
						i = { "@assignment.inner" },
						-- l = { "@assignment.lhs"}
					}),
					A = ts_spec({
						a = { "@assignment.lhs" },
						i = { "@assignment.rhs" }

					}),
					f = ts_spec({
						a = { "@call.outer" },
						i = { "@call.inner" },
					}),
					c = ts_spec({
						a = { "@class.outer" },
						i = { "@class.inner" },
						-- s = { "@class.scope" },
					}),
					g = ts_spec({
						a = { "@comment.outer" },
						i = { "@comment.inner" },
					}),
					s = ts_spec({
						a = { "@statement.outer" },
						i = { "@statement.inner" },
					}),
					T = ts_spec({
						a = { "@type.outer", "@type" },
						i = { "@type.inner", "@type" },
					}),
					e = ts_spec({
						a = { "@enum" },
						i = { "@enum" },
					}),
					j = ts_spec({
						a = { "@tag_name", "@name" },
						i = { "@tag_name", "@name" },
					}),
					v = ts_spec({
						a = { "@value.outer" },
						i = { "@value.inner" },
					}),
				},
				n_lines = 300,
				search_method = "cover_or_next",
				silent = false,
			})
		end,
	},

	{
		"nvim-treesitter/nvim-treesitter-textobjects",
		dependencies = {
			"nvim-treesitter"
		},
		lazy = true,
		config = function()
			require("nvim-treesitter").setup({
				custom_textobjects = {
					["L="] = { "@assignment.lhs" },
					["R="] = { "@assignment.rhs" },
				},
			})
		end,
	},
}
