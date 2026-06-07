return {
	{

		{
			"saghen/blink.cmp",
			dependencies = {
				{
					"L3MON4d3/LuaSnip",
					version = "v2.*",
					dependencies = { "rafamadriz/friendly-snippets" },
				},

				{
					"folke/lazydev.nvim",
					-- cond = function()
					-- 	return vim.fn.getcwd():find(
					-- 		vim.fn.expand "~/.config/nvim",
					-- 		1,
					-- 		true
					-- 	) ~= nil
					-- end,
					opts = {
						library = {
							"LazyVim",
							words = { "LazyVim" },
						},
					},
					integrations = {
						lspconfig = true,
						cmp = false,
					},
				},
			},
			-- },
			config = function(_, opts)
				local is_nvim_config = vim.fn.expand("%:p"):find(
					vim.fn.expand "~/.config/nvim",
					1,
					true
				) ~= nil
				if is_nvim_config then
					table.insert(opts.sources.default, "lazydev")
				end
				require("blink-cmp").setup(opts)
			end,

			version = "*",

			---@module 'blink.cmp'
			---@type blink.cmp.Config
			opts = {
				keymap = {
					-- C-CR is not working as a select_and_accept input
					["<C-CR>"] = { "select_and_accept", "fallback" },
					["<C-y>"] = { "select_and_accept", "fallback" },
					["<C-space>"] = {
						"show",
						"show_documentation",
						"hide_documentation",
					},
					["<C-h>"] = { "hide", "fallback" },

					["<A-j>"] = {
						"snippet_forward",
						-- "select_and_accept",
						"fallback",
					},
					-- F1 - F9 Selection Mappings
					["<F1>"] = {
						function(cmp)
							local t_idx = 1
							local c_idx = cmp.get_selected_item_idx()
							local diff = t_idx - c_idx
							cmp.select_next { count = diff }
						end,
					},
					["<F2>"] = {
						function(cmp)
							local t_idx = 2
							local c_idx = cmp.get_selected_item_idx()
							local diff = t_idx - c_idx
							cmp.select_next { count = diff }
						end,
					},
					["<F3>"] = {
						function(cmp)
							local t_idx = 3
							local c_idx = cmp.get_selected_item_idx()
							local diff = t_idx - c_idx
							cmp.select_next { count = diff }
						end,
					},
					["<F4>"] = {
						function(cmp)
							local t_idx = 4
							local c_idx = cmp.get_selected_item_idx()
							local diff = t_idx - c_idx
							cmp.select_next { count = diff }
						end,
					},
					["<F5>"] = { function(cmp) local t_idx = 5
							local c_idx = cmp.get_selected_item_idx()
							local diff = t_idx - c_idx
							cmp.select_next { count = diff } end },
					["<F6>"] = { function(cmp) local t_idx = 6
							local c_idx = cmp.get_selected_item_idx()
							local diff = t_idx - c_idx
							cmp.select_next { count = diff } end },
					["<F7>"] = { function(cmp) local t_idx = 7
							local c_idx = cmp.get_selected_item_idx()
							local diff = t_idx - c_idx
							cmp.select_next { count = diff } end },
					["<F8>"] = { function(cmp) local t_idx = 8
							local c_idx = cmp.get_selected_item_idx()
							local diff = t_idx - c_idx
							cmp.select_next { count = diff } end },
					["<F9>"] = { function(cmp) local t_idx = 9
							local c_idx = cmp.get_selected_item_idx()
							local diff = t_idx - c_idx
							cmp.select_next { count = diff } end },

					["<A-k>"] = {
						"snippet_backward",
						"fallback",
					},

					["<Up>"] = { "select_prev", "fallback" },
					["<Down>"] = { "select_next", "fallback" },
					["<C-p>"] = { "select_prev", "fallback" },
					["<C-n>"] = { "select_next", "fallback" },

					["<C-b>"] = {
						"scroll_documentation_up",
						"fallback",
					},
					["<C-f>"] = {
						"scroll_documentation_down",
						"fallback",
					},

					["<C-s>"] = {
						"show_signature",
						"hide_signature",
						"fallback",
					},
				},
				snippets = { preset = "luasnip" },

				signature = {
					enabled = true,
				},
				sources = {
					default = {
						"lsp",
						"snippets",
						"buffer",
						"path",
						-- "codecompanion",
						-- "lazydev",
					},
					per_filetype = {
						lua = function()
							local is_nvim = vim.fn
								.getcwd()
								:find(vim.fn.expand("~/.config/nvim"), 1, true) ~= nil
							return is_nvim
									and {
										"lsp",
										"snippets",
										"buffer",
										"path",
										"lazydev",
									}
								or {
									"lsp",
									"snippets",
									"buffer",
									"path",
								}
						end,
					},
					providers = {
						lsp = {
							name = "lsp",
							enabled = true,
							module = "blink.cmp.sources.lsp",
							score_offset = 200,
						},
						lazydev = {
							name = "LazyDev",
							enabled = function()
								return pcall(
									require,
									"lazydev.integrations.blink"
								)
							end,
							module = "lazydev.integrations.blink",
							score_offset = 300,
						},
						snippets = {
							name = "Snippets",
							enabled = true,
							module = "blink.cmp.sources.snippets",
							score_offset = 20,
						},
						-- crates = {
						-- 	name = "Crates",
						-- 	enabled = true,
						-- 	module = "crates",
						-- },
					},
				},
				cmdline = {
					enabled = true,
					completion = {
						menu = {
							auto_show = true,
						},
					},
					keymap = {
						-- C-CR is not working as a select_and_accept input
						["<C-CR>"] = { "select_and_accept" },
						["<C-h>"] = { "hide", "fallback" },
						["<C-space>"] = {
							"show",
							"show_documentation",
							"hide_documentation",
						},

						["<Tab>"] = {
							"snippet_forward",
							"select_and_accept",
							"fallback",
						},
						["<S-Tab>"] = {
							"snippet_backward",
							"fallback",
						},

						["<Up>"] = { "select_prev", "fallback" },
						["<Down>"] = { "select_next", "fallback" },

						["<C-Up>"] = { "scroll_documentation_up" },
						["<C-Down>"] = { "scroll_documentation_up" },

						["<C-s>"] = {
							"show_signature",
							"hide_signature",
							"fallback",
						},
					},
				},
				completion = {
					menu = {
						border = "rounded",
						max_height = 10,
						min_width = 30,
						draw = {
							columns = {
								{
									"item_idx",
									"label",
									"label_description",
									gap = 1,
								},
								{ "kind_icon" },
							},
							components = {
								item_idx = {
									text = function(ctx)
										return tostring(ctx.idx)
									end,
									highlight = "BlinkCmpItemIdx", -- optional, only if you want to change its color
								},
							},
							gap = 1,
							treesitter = { "lsp" },
						},
					},
					documentation = {
						auto_show = true,
						auto_show_delay_ms = 350,
						window = {
							border = "rounded",
						},
					},
					accept = {
						auto_brackets = {
							enabled = true,
						},
					},
					ghost_text = {
						enabled = true,
					},
				},
				appearance = {
					-- use_nvim_cmp_as_default = true,
					nerd_font_variant = "mono",

					kind_icons = {
						Text = " 󰉿 ",
						Method = "  ",
						Function = " 󰊕 ",
						Constructor = " 󰒓 ",

						Field = "  ",
						Variable = " 󰆦 ",
						Property = " 󰖷 ",

						Class = "  ",
						Interface = "  ",
						Struct = "  ",
						Module = " 󰅩 ",

						Unit = " 󰪚 ",
						Value = " 󰦨 ",
						Enum = "{𝗘}",
						EnumMember = "  ",

						Keyword = " 󰻾 ",
						Constant = " 󰏿 ",

						Snippet = "  ",
						Color = " 󰏘 ",
						File = " 󰈔 ",
						Reference = " 󰬲 ",
						Folder = "  ",
						Event = "  ",
						Operator = " 󰪚 ",
						TypeParameter = "  ",
						Error = "  ",
						Warning = "  ",
						Information = "  ",
						Hint = " 󰏭 ",
					},
				},
			},
			opts_extend = { "sources.default" },
		},
	},
}
