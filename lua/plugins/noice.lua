return {
	"folke/noice.nvim",
	event = "VeryLazy",
	dependencies = { "MunifTanjim/nui.nvim", },
	opts = {
		cmdline = {
			enabled = true,
			view = "cmdline_popup",
			opts = {},
		},
		popupmenu = {
			enabled = false,
			---@type 'nui'|'cmp'
			backend = "nui",
			kind_icons = {},
		},
		notify = {
			enabled = false,
		},
		messages = {
			enabled = true,
			documentation = false,
			view = "notify",
			view_error = "notify",
			view_warn = "notify",
			view_history = "messages",
			view_search = "virtualtext",
		},
		message = {
			enabled = true
		},
		documentation = {
			view = "hover",
			opts = {
				lang = "markdown",
				replace = true,
				render = "plain",
				format = { "{message}" },
				win_options = { concealcursor = "n", conceallevel = 3 }
			}
		},
		lsp = {
			signature = {
				enabled = true,
				auto_open = {
					enabled = true,
					trigger = true,
					luasnip = true,
					throttle = 50,
				},
			},
			override = {
				["vim.lsp.util.convert_input_to_markdown_lines"] = true,
				["vim.lsp.util.stylize_markdown"] = true,
				["vim.lsp.get_documentation"] = true,
			},
			progress = {
				enabled = true,
			}
		},
		markdown = {
			hover = {
				["|(%S-)|"] = vim.cmd.help,             -- vim help links
				["%[.-%]%((%S-)%)"] = require("noice.util").open, -- markdown links
			},
			highlights = {
				["|%S-|"] = "@text.reference",
				["@%S+"] = "@parameter",
				["^%s*(Parameters:)"] = "@text.title",
				["^%s*(Return:)"] = "@text.title",
				["^%s*(See also:)"] = "@text.title",
				["{%S-}"] = "@parameter",
			},
		},
		presets = {
			bottom_search = false,
			-- command_pallete = true,
			long_message_to_split = false,
			inc_rename = false,
			lsp_doc_border = false,
		},
	},
}
