return {
	"folke/tokyonight.nvim",
	lazy = false,
	priority = 1000,
	opts = {},
	config = function()
		require("tokyonight").setup({
			transparent = false,
			style = "storm",
			terminal_colors = true,
			theme = "dark",
			styles = {
				comments = { italic = true },
				keywords = { bold = true, italic = false },
				functions = { bold = true, italic = true },
				variables = { bold = false, italic = true },
				-- sidebars = "opaque",
				-- floats = "opaque",
			},
			cache = true,
			on_colors = function(colors)
				colors.bg = "#202335"
			end,
		})

		vim.o.termguicolors = true
		vim.opt.termguicolors = true
		vim.cmd("colorscheme tokyonight-storm")
	end,
}
