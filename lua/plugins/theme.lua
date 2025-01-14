-- YT_CHANNEL: @VoylinsGamedevJourney
-- YT_VID: https://www.youtube.com/watch?v=9xTiuiomIy0&t=2001s

-- NOTE: this is the theme that I'm currently using though I'm looking for something with more light blue / cyan
return {
	-- "rebelot/kanagawa.nvim",
	"folke/tokyonight.nvim",
	lazy = false,
	priority = 1000,
	opts = {},
	config = function()
		require("tokyonight").setup({
			-- transparent = true,
			style = "moon",
			terminal_colors = true,
			styles = {
				comments = { italic = true },
				keywords = { bold = true, italic = false },
				functions = { bold = true, italic = true },
				variables = { bold = false, italic = true },
				sidebars = "transparent",
				floats = "transparent",
			},
			cache = true,
		})

		vim.o.termguicolors = true
		-- vim.opt.termguicolors = true
		vim.cmd("colorscheme tokyonight-storm")

		-- vim.cmd([[
		-- 	  highlight Normal guibg=#000FF09
		-- 	  highlight NonText guibg=none
		--   highlight Normal ctermbg=none
		-- 	  highlight NonText ctermbg=none
		-- ]])
		--
	end,
}
