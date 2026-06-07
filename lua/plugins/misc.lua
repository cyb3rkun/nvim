return {

	{
		"nvim-mini/mini.surround",
		event = { "BufNewFile", "BufReadPre" },
		version = false,

		config = function()
			require("mini.surround").setup({
				-- Add custom surroundings to be used on top of builtin ones. For more
				-- information with examples, see `:h MiniSurround.config`.
				custom_surroundings = nil,

				-- Duration (in ms) of highlight when calling `MiniSurround.highlight()`
				highlight_duration = 500,

				-- Module mappings. Use `''` (empty string) to disable one.
				mappings = {
					add = "ma", -- Add surrounding in Normal and Visual modes
					delete = "md", -- Delete surrounding
					find = "mf", -- Find surrounding (to the right)
					find_left = "mF", -- Find surrounding (to the left)
					highlight = "mh", -- Highlight surrounding
					replace = "mc", -- change surrounding

					suffix_last = "l", -- Suffix to search with "prev" method
					suffix_next = "n", -- Suffix to search with "next" method
				},

				-- Number of lines within which surrounding is searched
				n_lines = 20,

				-- Whether to respect selection type:
				-- - Place surroundings on separate lines in linewise mode.
				-- - Place surroundings on each line in blockwise mode.
				respect_selection_type = false,

				-- How to search for surrounding (first inside current line, then inside
				-- neighborhood). One of 'cover', 'cover_or_next', 'cover_or_prev',
				-- 'cover_or_nearest', 'next', 'prev', 'nearest'. For more details,
				-- see `:h MiniSurround.config`.
				search_method = "cover_or_next",

				-- Whether to dlsable showlng non-error feedback
				-- This also affects (purely informational) helper messages shown after
				-- idle time if user input is required.
				silent = true,
			})
		end,
	},
	{
		"eero-lehtinen/oklch-color-picker.nvim",
		event = "VeryLazy",
		version = "*",
		keys = {
			{
				"<leader>v",
				function()
					require("oklch-color-picker").pick_under_cursor()
				end,
				desc = "Color pick under cursor",
			},
		},
		---@type oklch.Opts
		opts = {},
	},

	{
		"mbbill/undotree",
		cmd = { "UndotreeToggle", "Undotree" },
		keys = {
			{
				"<leader>u",
				function() vim.cmd("UndotreeToggle") end,
			},
		},
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
		end,
	},
	{
		"MeanderingProgrammer/render-markdown.nvim",
		dependencies = {
			-- "nvim-treesitter/nvim-treesitter",
			"nvim-tree/nvim-web-devicons",
		},
		---@module 'render-markdown'
		---@type render.md.UserConfig
		opts = {},
		config = function()
			require("render-markdown").setup({
				checkbox = {
					enabled = true,
					custom = {
						cancelled = {
							raw = "[*]",
							rendered = "󰜺",
							highlight = "Comment",
							scope_highlight = "@markup.strikethrough",
						},
					},
				},
			})
		end,
		ft = { "markdown" },
	},
	{
		"MagicDuck/grug-far.nvim",
		config = function()
			require("grug-far").setup({})
			local grg = require("grug-far")
		end,
		keys = {
			{
				"<leader>sr",
				function()
					require("grug-far").open({ engine = "ripgrep" })
				end,
				desc = "grug-far: Search within range (ripgrep)",
				mode = { "n", "x" },
			},
			{
				"<leader>st",
				function()
					require("grug-far").open({ engine = "astgrep" })
				end,
				desc = "grug-far: Search within range (astgrep)",
				mode = { "n", "x" },
			},
		},
	},
}
