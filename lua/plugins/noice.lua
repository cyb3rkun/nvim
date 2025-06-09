return {
	"folke/noice.nvim",
	event = "VeryLazy",
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
			---@type NoiceItemPopupMenuItemKind|false
			kind_icons = {},

		},
		messages = {
			enabled = true,
			documentation = true,
			view = "notify",
			view_error = "notify",
			view_warn = "notify",
			view_history = "messages",
			view_search = "virtualtext",
		},
		lsp = {
			signature = {
				enabled=false,
				auto_open = {
					enabled = true,
					trigger = true,
					luasnip = true,
					throttle = 50,
				}
			},
			-- override = {
			-- 	["vim.lsp.util.convert_input_to_markdown_lines"] = true,
			-- 	["vim.lsp.util.stylize_markdown"] = true,
			-- 	["vim.lsp.get_documentation"] = true,
			-- },
		},
		presets = {
			bottom_search = false,
			-- command_pallete = true,
			long_message_to_split = false,
			inc_rename = false,
			-- lsp_doc_border = false,
		}
	},
	dependencies = {
		"MunifTanjim/nui.nvim",
		{
			"rcarriga/nvim-notify",
			config = function()
				require("notify").setup({
					enabled = true,
					timeout = 50,
				})
			end,
		},
	},
}

