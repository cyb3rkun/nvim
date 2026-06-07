return {
	"nvim-lualine/lualine.nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
		"folke/noice.nvim",
	},
	config = function()
		local n = require "noice"
		local nstat = n.api.status
		local lualine = require "lualine"
		lualine.setup {
			options = {
				theme = "tokyonight-storm",
				globalstatus = true,
			},
			sections = {
				lualine_a = {
					"mode",

					{
						nstat.mode.get,
						cond = nstat.mode.has,
					},
				},
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
						nstat.command.get,
						cond = nstat.command.has,
					},
					---@diagnostic enable: undefined-field
					"encoding",
					"fileformat",
					"filetype",
				},
				lualine_y = { "progress" },
				lualine_z = { "location" },
			},
		}
	end,
}
