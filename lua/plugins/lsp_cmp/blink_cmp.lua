return {
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
				dependencies = {
					"gonstoll/wezterm-types",
					-- lazy = true,
				},
				opts = {
					lsp = {
						settings = {
							Lua = {
								workspace = {
									checkThirdParty = "Apply",
								},
							},
						},
					},
					library = {
						{ path = "wezterm-types", mods = { "wezterm" } },
					},
				},
			},
			{
				"saecki/crates.nvim",
				event = { "BufRead Cargo.toml" },
				config = function()
					require("crates").setup({
						lsp = {
							enabled = true,
							actions = true,
							hover = false,
							completion = true,
						},
					})
				end,
			},
		},
		-- },

		version = "*",

		--- @module 'blink.cmp'
		--- @type blink.cmp.Config
		opts = {
			keymap = {
				-- C-CR is not working as a select_and_accept input
				["<C-CR>"] = { "select_and_accept", "fallback" },
				["<C-y>"] = { "select_and_accept", "fallback" },
				["<C-space>"] = { "show", "show_documentation", "hide_documentation" },
				["<C-h>"] = { "hide", "fallback" },

				["<A-j>"] = {
					"snippet_forward",
					-- "select_and_accept",
					"fallback",
				},

				["<A-k>"] = {
					"snippet_backward",
					"fallback",
				},

				["<Up>"] = { "select_prev", "fallback" },
				["<Down>"] = { "select_next", "fallback" },
				["<C-p>"] = { "select_prev", "fallback" },
				["<C-n>"] = { "select_next", "fallback" },

				["<C-b>"] = { "scroll_documentation_up", "fallback" },
				["<C-f>"] = { "scroll_documentation_down", "fallback" },

				["<C-s>"] = { "show_signature", "hide_signature", "fallback" },
			},
			snippets = { preset = "luasnip" },

			signature = {
				enabled = true,
			},
			sources = {
				default = { "lazydev", "lsp", "buffer", "path", "snippets" },
				providers = {
					lsp = {
						name = "lsp",
						enabled = true,
						module = "blink.cmp.sources.lsp",
						score_offset = 200,
					},
					lazydev = {
						name = "LazyDev",
						enabled = true,
						module = "lazydev.integrations.blink",
						score_offset = 300,
					},
					snippets = {
						name = "Snippets",
						enabled = true,
						module = "blink.cmp.sources.snippets",
						score_offset = 20,
					},
					crates = {
						name = "crates",
						enabled = true,
						module = "crates",
					},
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
					["<C-space>"] = { "show", "show_documentation", "hide_documentation" },

					["<Tab>"] = {
						"snippet_forward",
						"select_and_accept",
						"fallback",
					},
					["<S-Tab>"] = { "snippet_backward", "fallback" },

					["<Up>"] = { "select_prev", "fallback" },
					["<Down>"] = { "select_next", "fallback" },

					["<C-b>"] = { "scroll_documentation_up", "fallback" },
					["<C-f>"] = { "scroll_documentation_down", "fallback" },

					["<C-s>"] = { "show_signature", "hide_signature", "fallback" },
				},
			},
			completion = {
				menu = {
					border = "rounded",
					draw = {
						columns = {
							{
								--[[ "source_name", ]]
								"label",
								"label_description",
								gap = 1,
							},
							{ "kind_icon" },
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
}
