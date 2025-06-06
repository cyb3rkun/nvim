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
				"IblFour",
				"IblFive",
				"IblSix",
				"IblSeven",
			}
			local whitespace_hl = {
				"ColorColumn",
				"Whitespace",
			}
			local hooks = require("ibl.hooks")
			hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
				vim.api.nvim_set_hl(0, "IblOne", { fg = "#ff8f8f" })
				vim.api.nvim_set_hl(0, "IblTwo", { fg = "#ff6666" })
				vim.api.nvim_set_hl(0, "IblThree", { fg = "#ff3d3d" })
				vim.api.nvim_set_hl(0, "IblFour", { fg = "#ff1414" })
				vim.api.nvim_set_hl(0, "IblFive", { fg = "#c20000" })
				vim.api.nvim_set_hl(0, "IblSix", { fg = "#990000" })
				vim.api.nvim_set_hl(0, "IblSeven", { fg = "#700000" })
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
					enabled = false,
					show_start = true,
					show_end = true,
					-- include = {
					-- 	node_type = {
					-- 		["*"] = { "*" },
					-- 	},
					-- },
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
			local function relative_path()
				return [[path is path!]]
			end
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
					lualine_x = { "encoding", "fileformat", "filetype" },
					lualine_y = { "progress" },
					lualine_z = { "location" },
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

			keymap("n", "<Insert>", substitute.operator, { desc = "Substitute with motion" })
			keymap("n", "<Insert><Insert>", substitute.line, { desc = "Substitute line" })
			keymap("n", "Q", substitute.eol, { desc = "Substitute to end of line" })
			keymap("x", "q", substitute.line, { desc = "Substitute in visual mode" })

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
