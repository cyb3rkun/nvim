return {
	-- Small plugins
	{
		{
			"https://git.sr.ht/~whynothugo/lsp_lines.nvim",
			config = function()
				require("lsp_lines").setup()
				-- pri
				vim.diagnostic.config({
					virtual_text = false,
					virtual_lines = {
						only_current_line = false,
					},
				})
				vim.keymap.set("", "<leader>sl", require("lsp_lines").toggle, { desc = "Toggle lsp_lines" })
			end,
		},
		{
			"windwp/nvim-autopairs",
			event = { "InsertEnter" },
			config = true,
		},
		{
			"kylechui/nvim-surround",
			event = "VeryLazy",
			config = function()
				require("nvim-surround").setup({})
			end,
		},
		{
			"christoomey/vim-tmux-navigator",
			lazy = false,
			cmd = {
				"TmuxNavigateLeft",
				"TmuxNavigateDown",
				"TmuxNavigateUp",
				"TmuxNavigateRight",
				"TmuxNavigatePrevious",
			},
		},
		{
			"stevearc/dressing.nvim",
			event = "VeryLazy",
		},
		{
			"eero-lehtinen/oklch-color-picker.nvim",
			event = "VeryLazy",
			opts = {},
			keys = {
				{
					"<localleader>v",
					"<cmd>ColorPickOklch<cr>",
					desc = "Color pick Under the cursor",
				},
			},
		},
		{
			"mbbill/undotree",
			config = function()
				vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)
			end,
		},
		{
			"folke/ts-comments.nvim",
			opts = {},
			event = "VeryLazy",
			enabled = vim.fn.has("nvim-0.10.0") == 1,
		},
		{
			"numToStr/Comment.nvim",
			-- NOTE: this plugin gets loaded when opening or creating a new file
			event = { "BufReadPre", "BufNewFile" },
			config = function()
				local comment = require("Comment")
				comment.setup()
				-- NOTE: if you want to customize the configuration
				-- define it after setup to get a list of options that can
				-- be modified you can run :h comment.config
			end,
		},
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		event = { "BufReadPre", "BufNewFile" },
		main = "ibl",
		opts = function()
			local highlight = {
				"IblOne",
				"IblTwo",
				"IblThree",
				-- "Whitespace"
			}
			local whitespace_hl = {
				"ColorColumn",
				"Whitespace",
			}
			local hooks = require("ibl.hooks")
			hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
				vim.api.nvim_set_hl(0, "IblOne", { fg = "#23383d" })
				vim.api.nvim_set_hl(0, "IblTwo", { fg = "#52848d" })
				vim.api.nvim_set_hl(0, "IblThree", { fg = "#9abec5" })
			end)
			hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
				vim.api.nvim_set_hl(0, "One", { bg = "#1b1c30" })
				vim.api.nvim_set_hl(0, "Two", { bg = "#2b2c47" })
			end)
			return {
				indent = {
					highlight = highlight,
				},
				scope = {
					enabled = true,
					show_start = true,
					show_end = true,
					include = {
						node_type = {
							["*"] = { "*" },
						},
					},
				},
				whitespace = {
					-- highlight = whitespace_hl
				},
			}
		end,
		-- config = function() end,
		-- config = function() end,
	},
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("lualine").setup({
				options = {
					theme = "tokyonight-storm",
				},
			})
		end,
	},
	{
		"NeogitOrg/neogit",
		cmd = "Neogit",
		dependencies = {
			"nvim-lua/plenary.nvim", -- required
			"sindrets/diffview.nvim", -- optional - Diff integration

			-- Only one of these is needed.
			"nvim-telescope/telescope.nvim", -- optional
			"ibhagwan/fzf-lua", -- optional
			"echasnovski/mini.pick", -- optional
		},
		config = true,
	},
	{
		"gbprod/substitute.nvim",
		event = { "BufReadPre", "BufNewFile" },

		config = function()
			local substitute = require("substitute")
			local exchange = require("substitute.exchange")

			substitute.setup({
				yank_substituted_text = true,
			})

			local keymap = vim.keymap.set

			keymap("n", "q", substitute.operator, { desc = "Substitute with motion" })
			keymap("n", "qq", substitute.line, { desc = "Substitute line" })
			keymap("n", "Q", substitute.eol, { desc = "Substitute to end of line" })
			keymap("x", "q", substitute.line, { desc = "Substitute in visual mode" })

			keymap("n", "sx", exchange.operator, {
				noremap = true,
				desc = "swap with motion",
			})
			keymap("n", "sxx", exchange.line, {
				noremap = true,desc = "swap linewise"
			})
			keymap("x", "X", exchange.visual, {
				noremap = true,desc = "swap visual selection"
			})
			keymap("n", "sxc", exchange.cancel, {
				noremap = true,desc = "cancel swap"
			})
		end,
	},
}
