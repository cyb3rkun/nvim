return {
	{
		"nvim-treesitter/nvim-treesitter",
		lazy = false,
		build = ":TSUpdate",
		config = function() require("nvim-treesitter").setup({}) end,
	},
	{
		"windwp/nvim-ts-autotag",
		-- event = "VeryLazy",
		ft = {
			"html",
			"xml",
			"javascript",
			"typescript",
			"javascriptreact",
			"typescriptreact",
			"astro",
			"vue",
			"svelte",
			"php",
			"eruby",
			"markdown",
			"htmldjango",
		},
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

					-- goto_left = "g[",
					-- goto_right = "g]",
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
					i = ts_spec({
						a = { "@conditional.outer" },
						i = { "@conditional.inner" },
					}),
					l = ts_spec({
						a = { "@loop.outer" },
						i = { "@loop.inner" },
					}),
					a = ts_spec({
						a = { "@parameter.outer", "@argument.outer" },
						i = { "@parameter.inner", "@argument.inner" },
					}),
					k = ts_spec({
						a = { "@block.outer" },
						i = { "@block.inner" },
					}),
					-- don't know if this works ...
					["="] = ts_spec({
						a = { "@assignment.outer" },
						i = { "@assignment.inner" },
					}),
					-- A = ts_spec({
					-- 	a = { "@assignment.lhs" },
					-- 	i = { "@assignment.rhs" }
					--
					-- }),
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
		event = { "BufReadPost" },
		branch = "main",
		init = function() vim.g.no_plugin_maps = true end,
		config = function()
			require("nvim-treesitter-textobjects").setup({
				select = {
					lookahead = true,
				},
			})
			-- NOTE: this plugins is to provide default text objects.
			-- queries and keymaps are defined using mini.ai plugin above
			-- keymaps
			local map = vim.keymap.set
			map(
				"n",
				";a",
				function()
					require("nvim-treesitter-textobjects.swap").swap_next(
						"@parameter.inner"
					)
				end
			)
			map(
				"n",
				";A",
				function()
					require("nvim-treesitter-textobjects.swap").swap_previous(
						"@parameter.outer"
					)
				end
			)
			map(
				{ "n", "x", "o" },
				"vl=",
				function()
					require("nvim-treesitter-textobjects.select").select_textobject(
						"@assignment.lhs",
						"textobjects"
					)
				end
			)
			map(
				{ "n", "x", "o" },
				"vr=",
				function()
					require("nvim-treesitter-textobjects.select").select_textobject(
						"@assignment.rhs",
						"textobjects"
					)
				end
			)
			map(
				{ "n", "x", "o" },
				"gn",
				function()
					require("nvim-treesitter-textobjects.select").select_textobject(
						"@local.scope",
						"locals"
					)
				end
			)
		end,
	},
}
