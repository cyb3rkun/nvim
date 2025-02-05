return {
	{
		"saghen/blink.cmp",
		dependencies = {
			"rafamadriz/friendly-snippets",
			"L3MON4d3/LuaSnip",
			"folke/lazydev.nvim",
		},

		version = "*",

		---@module 'blink.cmp'
		---@type blink.cmp.Config
		opts = {
			keymap = {
				preset = "default",
				-- C-CR is not working as a select_and_accept input
				["<C-CR>"] = { "select_and_accept" },
				["<C-y>"] = { "select_and_accept", "fallback" },
				["<CR>"] = {},
				-- ["<C-SPACE>"] = { "show", "fallback" },
				-- ["<CR>"] = { "accept", "fallback" },
				["<C-space>"] = { "show", "show_documentation", "hide_documentation" },
				["<C-e>"] = { "hide", "fallback" },

				["<Tab>"] = { "snippet_forward", "fallback" },
				["<S-Tab>"] = { "snippet_backward", "fallback" },

				["<Up>"] = { "select_prev", "fallback" },
				["<Down>"] = { "select_next", "fallback" },
				["<C-p>"] = { "select_prev", "fallback" },
				["<C-n>"] = { "select_next", "fallback" },

				["<C-b>"] = { "scroll_documentation_up", "fallback" },
				["<C-f>"] = { "scroll_documentation_down", "fallback" },

				["<C-k>"] = { "show_signature", "hide_signature", "fallback" },
			},
			snippets = {
				preset = "luasnip",
				jump = function(direction)
					require("luasnip").jump(-direction)
				end,
			},
			appearance = {
				-- use_nvim_cmp_as_default = true,
				nerd_font_variant = "mono",

				kind_icons = {
					Text = "󰉿 ",
					Method = " ",
					Function = "󰊕 ",
					Constructor = "󰒓 ",

					Field = "󰜢 ",
					Variable = "󰆦 ",
					Property = "󰖷 ",

					Class = "󱡠 ",
					Interface = "󱡠 ",
					Struct = "󱡠 ",
					Module = "󰅩 ",

					Unit = "󰪚 ",
					Value = "󰦨 ",
					Enum = "󰦨 ",
					EnumMember = "󰦨 ",

					Keyword = "󰻾 ",
					Constant = "󰏿 ",

					Snippet = "  ",
					Color = "󰏘 ",
					File = "󰈔 ",
					Reference = "󰬲 ",
					Folder = "󰉋 ",
					Event = "󱐋 ",
					Operator = "󰪚 ",
					TypeParameter = "󰬛 ",
					Error = "󰏭 ",
					Warning = "󰏯 ",
					Information = "󰏮 ",
					Hint = "󰏭 ",
				},
			},

			sources = {
				default = { "lazydev", "lsp", "path", "snippets", "buffer" },
				providers = {
					lazydev = {
						name = "LazyDev",
						module = "lazydev.integrations.blink",
						score_offset = 100,
					},
					snippets = {
						name = "Snippets",
						enabled = true,
						module = "blink.cmp.sources.snippets",
						score_offset = 20,
					},
				},
			},
			signature = { enabled = true },
			completion = {
				menu = {
					border = "single",
					draw = {
						columns = {
							{ "source_name", "label", "label_description", gap = 1 },
							{ "kind_icon" },
						},
						gap = 1,
						treesitter = { "lsp" },
					},
				},
				documentation = {
					auto_show = true,
					window = {
						border = "single",
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
		},
		opts_extend = { "sources.default" },
	},
}
