return {
	"hrsh7th/nvim-cmp",
	event = "InsertEnter",
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-cmdline",
		"hrsh7th/nvim-cmp",
		"L3MON4D3/LuaSnip",
		"saadparwaiz1/cmp_luasnip",
		"rafamadriz/friendly-snippets",
	},
	config = function()
		local cmp = require("cmp")
		local cmp_select = { behavior = cmp.SelectBehavior.Select }

		local luasnip = require('luasnip')

		require("luasnip.loaders.from_vscode").lazy_load()

		cmp.setup({
			-- Set completion menu options
			completion = {
				completeopt = "menu,menuone,preview,noselect",
			},
			--setup snippet engine and how nvim-cmp interacts with it
			snippet = {
				expand = function(args)
					luasnip.lsp_expand(args.body) -- Use Luasnip for expanding autocomplete functionality
				end,
			},
			-- Options for the completions window
			window = {
				completion = cmp.config.window.bordered(),
				documentation = cmp.config.window.bordered(),
			},
			-- Keymaps for completions
			mapping = cmp.mapping.preset.insert({
				["<C-k>"] = cmp.mapping.select_prev_item(cmp_select),
				["<C-j>"] = cmp.mapping.select_next_item(cmp_select),
				["<C-y>"] = cmp.mapping.confirm({ select = true }),
				["<C-b>"] = cmp.mapping.scroll_docs(-4),
				["<C-f>"] = cmp.mapping.scroll_docs(4),
				["<C-Space>"] = cmp.mapping.complete(), -- Show completions List
				["<Tab>"] = cmp.mapping(function(fallback)
					--this will select item with tab if no entry is selected it will select the first one
					if cmp.visible() then
						if not entry then
							cmp.select_next_item({
								behavior = cmp.SelectBehavior.select,
							})
						end
						cmp.confirm()
					else
						fallback()
					end
				end, { "i", "s" }),

				["<CR>"] = cmp.mapping({
					i = function(fallback)
						--this will confirm the selection with enter and if no entry will select the first item
						if cmp.visible() and cmp.get_active_entry() then
							cmp.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = false })
						else
							fallback()
						end
					end,
					s = cmp.mapping.confirm({ select = true }),
					c = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true }),
				}),
<<<<<<< Updated upstream
				sources = cmp.config.sources({
					{ name = "nvim_lsp" },
					{ name = "gdscript" },
					{ name = "luasnip" },
				}, {
					{ name = "buffer" },
				}),
			})
			local cmp_autopairs = require("nvim-autopairs.completion.cmp")
			cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
			vim.diagnostic.config({
				--update_in_insert = true
				float = {
					focusable = false,
					style = "default",
					border = "rounded",
					header = "diagnostics",
					prefix = "",
				},
			})
		end,
	},
=======
			}),
			sources = cmp.config.sources({
				{ name = "nvim_lsp" },
				{ name = "luasnip" },
				{ name = "buffer" },
				{ name = "path" },
			}),
		})
		local cmp_autopairs = require("nvim-autopairs.completion.cmp")
		cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
		vim.diagnostic.config({
			--update_in_insert = true
			float = {
				focusable = false,
				style = "default",
				border = "rounded",
				header = "diagnostics",
				prefix = "",
			},
		})
	end,
>>>>>>> Stashed changes
}
