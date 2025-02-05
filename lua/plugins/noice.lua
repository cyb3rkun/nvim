return {
	"folke/noice.nvim",
	event = "VeryLazy",
	opts = {
		messages = {
			enabled = true,
			documentation = false
		},
		lsp = {
			signature = {
				auto_open = {
					trigger = false,
				}
			},
			override = {
				["vim.lsp.util.convert_input_to_markdown_lines"] = true,
				["vim.lsp.util.stylize_markdown"] = true,
				["vim.lsp.get_documentation"] = true,
			},
		},
		presets = {
			-- bottom_search = true,
			-- command_pallete = true,
			long_message_to_split = true,
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
