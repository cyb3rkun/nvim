---@diagnostic disable: undefined-global

-- -@diagnostic disable: undefined-global
return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	---@type snacks.Config
	opts = {
		picker = require "plugins.snacks.config.picker",
		dashboard = require "plugins.snacks.config.dashboard",

		bigfile = { enabled = true },
		explorer = { enabled = true, auto_close = true },
		input = { enabled = true },
		notifier = {
			enabled = true,
			top_down = true,
			level = vim.log.levels.TRACE,
		},
		notify = { enabled = true },
		---@class snacks.indent.Config
		indent = {
			enabled = true,
			priority = 1,
			animate = {
				enabled = false,
			},
			scope = {
				enabled = true,
				underline = false,
				hl = "SnacksIndentScope",
			},
			hl = "SnacksIndent8",
		},
		quickfile = { enabled = true },
		-- statuscolumn = { enabled = true },
		words = { enabled = true, debounce = 80 },
		lazygit = { enabled = true, configure = true },

		image = { enabled = true },
	},
	keys = require "plugins.snacks.config.keys",
}
