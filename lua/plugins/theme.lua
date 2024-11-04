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
		-- local bg = "#011628"
		-- local bg_dark = "#011423"
		-- local bg_highlight = "#143652"
		-- local bg_search = "#0A64AC"
		-- local bg_sidebar = "#0d3b5e"
		-- local bg_visual = "#275378"
		-- local fg = "#CBE0F0"
		-- local fg_dark = "#B4D0E9"
		-- local fg_gutter = "#627E97"
		-- local border = "#547998"

		-- this is a comment that's supposed to be italic
		--[[ require("kanagawa").setup({
			undercurl = true,
			CommentStyle = { italic = true },
			functionStyle = { bold = true, italic = true },
			keywordStyle = { bold = true, italic = false },
			terminalColors = true,

			theme = "wave",
			colors = {
				palette = {},
			},
		}) ]]

		require("tokyonight").setup({
			style = "storm",
			terminal_colors = true,
			styles = {
				comments = { italic = true },
				keywords = { bold = true, italic = false },
				functions = { bold = true, italic = false },
				variables = { bold = false, italic = true },
				sidebars = "dark",
				floats = "dark",
			},
			cache = true,
		})

		vim.o.termguicolors = true
		-- vim.opt.termguicolors = true
		vim.cmd("colorscheme tokyonight-storm")
	end,
}
