return {
	"folke/tokyonight.nvim",
	lazy = false,
	priority = 1000,
	dependencies = {
		"xiyaowong/virtcolumn.nvim",
	},
	opts = {},
	config = function()
		local config = {
			transparent = true,
			style = "night",
			terminal_colors = true,
			theme = "dark",
			dim_inactive = false,
			lualine_bold = true,

			styles = {
				comments = { italic = true },
				keywords = { bold = true, italic = false },
				functions = { bold = true, italic = true },
				variables = { bold = false, italic = true },
				sidebars = "transparent",
				floats = "transparent",
			},

			on_colors = function(colors)
				colors.bg_statusline = colors.none
				colors.comment = "#407F90"
			end,

			cache = true,
		}
		require("tokyonight").setup(config)

		vim.o.termguicolors = true
		vim.opt.termguicolors = true
		vim.cmd("colorscheme tokyonight-storm")

		vim.g.virtcolumn_char = "⎸"
		vim.g.virtcolumn_priority = 0

		vim.api.nvim_set_hl(0, "CursorLine", {
			underline = true,
			-- fg = "#050505"
		})
		vim.api.nvim_set_hl(0, "ColorColumn", {
			bg = nil,
			fg = nil,
			-- "#000000",
		})
	end,
}
