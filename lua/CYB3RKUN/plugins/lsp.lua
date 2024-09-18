return {
	'neovim/nvim-lspconfig',
	dependencies = {
		'williamboman/mason.nvim',
		'williamboman/mason-lspconfig.nvim',
		'hrsh7th/cmp-nvim-lsp',
		'hrsh7th/cmp-buffer',
		'hrsh7th/cmp-path',
		'hrsh7th/cmp-cmdline',
		'hrsh7th/nvim-cmp',
		'windwp/nvim-autopairs',
		'L3MON4D3/LuaSnip',
		'saadparwaiz1/cmp_luasnip',
		'j-hui/fidget.nvim',
	},
	config = function()
		local cmp = require('cmp')
		local cmp_lsp = require('cmp_nvim_lsp')
		local capabilities = vim.tbl_deep_extend(
			'force',
			{},
			vim.lsp.protocol.make_client_capabilities(),
			cmp_lsp.default_capabilities())

		require('fidget').setup({})
		require('mason').setup()
		require('mason-lspconfig').setup({
			ensure_installed = {
				'clangd',
				'lua_ls',
				'rust_analyzer',
			},
			handlers = {
				function(server_name) --default handler (optional)
					require('lspconfig')[server_name].setup {
						capabilities = capabilities
					}
				end,
				['lua_ls'] = function()
					local lspconfig = require('lspconfig')
					lspconfig.lua_ls.setup {
						capabilities = capabilities,
						settings = {
							Lua = {
								runtime = {version = 'Lua 5.1'},
								diagnostics = {
									globals = { 'vim', 'it', 'describe', 'before_each', 'after_each' }
								}
							}
						}
					}
				end
			}
		})
		-- setup language lsp server for godot and gdscript
		require('lspconfig').gdscript.setup({ capabilities = capabilities })
		vim.keymap.set('n', '<leader>sg', function()
			vim.fn.serverstart '127.0.0.1:6004' end,
			{ noremap = true })

		local cmp_select = { behavior = cmp.SelectBehavior.Select }

		cmp.setup({
			snippet = {
				expand = function(args)
					require('luasnip').lsp_expand(args.body) -- For 'luasnip' users.
				end,
			},
			mapping = cmp.mapping.preset.insert({
				['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
				['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
				['<C-y>'] = cmp.mapping.confirm({select = true}),
				['<S-Space>'] = cmp.mapping.complete(),
				['<Tab>'] = cmp.mapping(function(fallback)

					--This snippet will select item with tab and if no entry is selected, will confirm the first item
					if cmp.visible() then
						local entry = cmp.get_selected_entry()
						if not entry then
							cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
						end
						cmp.confirm()
					else
						fallback()
					end

				end, {'i', 's', }),
					['<CR>'] = cmp.mapping({
						i = function(fallback)
						-- This will confirm the selection with Enter and if no entry selected, will add new line
						if cmp.visible() and cmp.get_active_entry() then
							cmp.confirm({behavior = cmp.ConfirmBehavior.Replace, select = false})
						else
							fallback()
						end
					end,
					s = cmp.mapping.confirm({ select = true}),
					c = cmp.mapping.confirm({behavior = cmp.ConfirmBehavior.Replace, select = true}),
				}),
			}),
			sources = cmp.config.sources({
				{ name = 'nvim_lsp' },
			}, {
				{name = 'buffer'},
			})
		})
		local cmp_autopairs = require('nvim-autopairs.completion.cmp')
		cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done())

		vim.diagnostic.config({
			--update_in_insert = true
			float = {
				focusable = false,
				style = 'minimal',
				border = 'rounded',
				source = 'always',
				header = '',
				prefix = '',
			},
		})
	end
}
