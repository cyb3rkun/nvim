return {
	-- Small plugins
	{
		{
			"windwp/nvim-autopairs",
			event = { "InsertEnter" },
			config = true,
		},
		{
			"kylechui/nvim-surround",
			event = "VeryLazy",
			config = function()
				require("nvim-surround").setup({
					keymaps = {
						visual = "<M-s>",
					},
				})
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
			"nvzone/minty",
			cmd = { "Shades", "Huefy" },
			dependencies = {
				"nvzone/volt",
				lazy = true,
			},
		},
		{
			"nvzone/typr",
			dependencies = {
				"nvzone/volt",
			},
			opts = {},
			cmd = { "Typr", "TyprStats" },
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
				vim.keymap.set(
					"n",
					"<leader>u",
					vim.cmd.UndotreeToggle
				)
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
		"nvim-lualine/lualine.nvim",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
			"folke/noice.nvim",
		},
		config = function()
			local noice = require("noice").api.status
			require("lualine").setup({
				options = {
					theme = "tokyonight-storm",
					globalstatus = true,
				},
				sections = {
					lualine_a = { "mode" },
					lualine_b = { "branch", "diff", "diagnostics" },
					lualine_c = {
						-- { relative_path },
						{
							"filename",
							file_status = true,
							path = 1,
						},
					},
					lualine_x = {
						---@diagnostic disable: undefined-field
						{
							noice.command.get,
							cond = noice.command.has,
						},
						---@diagnostic enable: undefined-field
						"encoding",
						"fileformat",
						"filetype",
					},
					lualine_y = { "progress" },
					lualine_z = {
						---@diagnostic disable: undefined-field
						{
							noice.mode.get,
							cond = noice.mode.has,
						},
						---@diagnostic enable: undefined-field
						"location",
					},
				},
			})
		end,
	},
	{
		"gbprod/substitute.nvim",
		event = { "BufReadPre", "BufNewFile" },

		config = function()
			local substitute = require("substitute")
			local exchange = require("substitute.exchange")

			substitute.setup({
				on_substitute = nil,
				yank_substituted_text = false,
				preserve_cursor_position = false,
				modifiers = nil,
				highlight_substituted_text = {
					enabled = true,
					timer = 500,
				},
				range = {
					prefix = "s",
					prompt_current_text = false,
					confirm = false,
					complete_word = false,
					subject = nil,
					range = nil,
					suffix = "",
					auto_apply = false,
					cursor_position = "end",
				},
				exchange = {
					motion = false,
					use_esc_to_cancel = true,
					preserve_cursor_position = false,
				},
			})

			local keymap = vim.keymap.set

			keymap(
				"n",
				"<Insert>",
				substitute.operator,
				{ desc = "Substitute with motion" }
			)
			keymap(
				"n",
				"<Insert><Insert>",
				substitute.line,
				{ desc = "Substitute line" }
			)
			keymap(
				"n",
				"<F3>",
				substitute.eol,
				{ desc = "Substitute to end of line" }
			)
			keymap(
				"x",
				"<F7>",
				substitute.line,
				{ desc = "Substitute in visual mode" }
			)

			keymap("n", "sx", exchange.operator, {
				noremap = true,
				desc = "swap with motion",
			})
			keymap("n", "sxx", exchange.line, {
				noremap = true,
				desc = "swap linewise",
			})
			keymap("x", "X", exchange.visual, {
				noremap = true,
				desc = "swap visual selection",
			})
			keymap("n", "sxc", exchange.cancel, {
				noremap = true,
				desc = "cancel swap",
			})
		end,
	},
	{
		"tomiis4/Hypersonic.nvim",
		event = "CmdlineEnter",
		cmd = "Hypersonic",
		config = function()
			require("hypersonic").setup({
				-- config
			})
		end,
	},
	{
		"MeanderingProgrammer/render-markdown.nvim",
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			"nvim-tree/nvim-web-devicons",
		},
		---@module 'render-markdown'
		---@type render.md.UserConfig
		opts = {},
	},
}
