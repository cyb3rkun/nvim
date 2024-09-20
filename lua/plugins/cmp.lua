return {
	{
		"L3MON4D3/LuaSnip",
		dependencies = {
			"saadparwaiz1/cmp_luasnip",
			"rafamadriz/friendly-snippets",
		},
	},
	{
		"hrsh7th/nvim-cmp",

		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-cmdline",
			"hrsh7th/nvim-cmp",
		},
		config = function()
			local cmp = require("cmp")
			local cmp_select = { behavior = cmp.SelectBehavior.Select }
			cmp.setup({
				--setup defualt snippet engine
				snippet = {
					expand = function(args)
						require("luasnip").lsp_expand(args.body) -- Use Luasnip for expanding autocomplete functionality
					end,
				},
				window = {
					completion = cmp.config.window.bordered(),
					documentation = cmp.config.window.bordered(),
				},
				mapping = cmp.mapping.preset.insert({
					["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
					["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
					["<C-y>"] = cmp.mapping.confirm({ select = true }),
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
				}),
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
}
