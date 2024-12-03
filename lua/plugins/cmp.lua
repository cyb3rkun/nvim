-- DESCRIPTION: In this file we set up autocompletion
-- YT: @joseanmartinez
-- YT_VID: https://www.youtube.com/watch?v=6pAG3BHurdM
-- NOTE: for plugins we return a table
-- containing the plugin url, the dependencies field, and the config = function()
return {
	"hrsh7th/nvim-cmp", -- NOTE: the github url for the autocompletion plugin
	event = "InsertEnter", -- NOTE: when the plugin should be loaded [when entering inser mode]

	dependencies = { -- NOTE: here we define the dependencies for nvim-cmp
		"hrsh7th/cmp-buffer", -- WARN: this is required for cmp
		"hrsh7th/cmp-path", -- NOTE: this allows filepaths to show in autocompletion
		"hrsh7th/cmp-cmdline",
		"windwp/nvim-autopairs", -- NOTE: this is to also autocomplete brackets when choosing a completion
		"L3MON4d3/LuaSnip", -- NOTE: load LuaSnip before configuring cmp
		"saadparwaiz1/cmp_luasnip", -- NOTE: we use luasnip as the autocompletion Engine
		"rafamadriz/friendly-snippets", -- NOTE: friendly-snippets provide vscode-like snippets for autocompletion
		"onsails/lspkind.nvim", -- NOTE: this plugin is to add vscode-like pictograms to neovim's built in lsp
	},

	-- NOTE: here we set up completion to work how we want it
	config = function()
		-- NOTE: here we import cmp although this is not strictly necessary
		local cmp = require("cmp")

		-- NOTE: here we import luasnip and lspkind
		local luasnip = require("luasnip")
		local lspkind = require("lspkind")

		-- NOTE: and we also import luasnipt's from_vscode module
		require("luasnip.loaders.from_vscode").lazy_load()

		-- NOTE: Now we call cmp's setup() function and pass in our desired configuration
		cmp.setup({
			-- NOTE: here we define some options, use :h cmp.complete for more information
			completion = {
				completeopt = "menu,menuone,preview,noselect",
			},

			-- NOTE: here we define our snippet engine to be used. in this case luasnip
			snippet = {
				expand = function(args)
					luasnip.lsp_expand(args.body)
				end,
			},

			-- NOTE: here we customize the appearance of the completion window.
			-- I like having borders, I think it makes it look pretty
			window = {
				completion = cmp.config.window.bordered(),
				documentation = cmp.config.window.bordered(),
			},

			-- NOTE: and finally we define completion specific keymaps
			mapping = cmp.mapping.preset.insert({
				-- NOTE: press CTRL+[ j / k ] to select the next or previous completion item
				["<C-k>"] = cmp.mapping.select_prev_item(),
				["<C-j>"] = cmp.mapping.select_next_item(),

				-- NOTE: press CTRL+y to confirm the selection
				["<C-y>"] = cmp.mapping.confirm({ select = true }),

				-- NOTE: use CTRL+[b/f] to scroll through the documentation of the selected item
				["<C-b>"] = cmp.mapping.scroll_docs(-4),
				["<C-f>"] = cmp.mapping.scroll_docs(4),

				-- NOTE: use control plus space to manually open the completions list
				["<C-Space>"] = cmp.mapping.complete(),

				-- NOTE: Abort the completion with <C-e>
				["<C-e>"] = cmp.mapping.abort(),

				-- NOTE: when tab is pressed call a fallback function to automatically
				-- select the first completion item and confirm that to be the selection
				-- So just press tab to automatically complete with the first item in the list
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

				-- NOTE: when ENTER is pressed on a completion item it will replace the current word
				-- with the selected item
				-- basically functions the same as tab
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

			-- NOTE: here we define the sources for the completions list
			sources = { -- NOTE: the order is important the first sources will be shown in the order that they are defined here
				{ name = "nvim_lsp" }, -- NOTE: first source is builtin nvim_lsp
				{ name = "luasnip" }, -- NOTE: The second source is luasnip
				{ name = "path" }, -- NOTE: after those we will get file paths
				{ name = "buffer" }, -- NOTE: this will allow snippets of text that is already in the current buffer to be used as a completion source
				{ name = "gdscript" }, -- NOTE: completions for gdscript
			},

			-- NOTE: here we define the format that completions shoudl be shown insert
			formatting = {
				format = lspkind.cmp_format({
					maxwidth = 100,
					ellipsis_char = "...",
				}),
			},
		})

		cmp.setup.cmdline("/", {
			sources = {
				{ name = "buffer" },
			},
		})

		cmp.setup.cmdline(":", {
			mapping = cmp.mapping.preset.cmdline(),
			sources = cmp.config.sources({
				{ name = "path" },
			}, {
				{
					name = "cmdline",
					option = {
						ignore_cmds = { "Man", "!" },
					},
				},
			}),
		})

		-- NOTE: when selecting an item brackets get autocompleted
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
}
