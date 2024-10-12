-- YT_CHANNEL: @VoylinsGamedevJourney
-- YT_VID: https://www.youtube.com/watch?v=9xTiuiomIy0&t=2001s

-- NOTE: this is the theme that I'm currently using though I'm looking for something with more light blue / cyan
return {
	"rebelot/kanagawa.nvim",
	-- "folke/tokyonight.nvim",
	config = function()
		-- require("kanagawa").setup({})

		local bg = "#011628"
		local bg_dark = "#011423"
		local bg_highlight = "#143652"
		local bg_search = "#0A64AC"
		local bg_sidebar = "#0d3b5e"
		local bg_visual = "#275378"
		local fg = "#CBE0F0"
		local fg_dark = "#B4D0E9"
		local fg_gutter = "#627E97"
		local border = "#547998"

		require("kanagawa").setup({
			undercurl = true,
			commentStyle = { italic = true },
			keywordStyle = { bold = true },
			terminalColors = true,

			theme = "wave",
			colors = {
				palette = {},
			},
		})

		vim.o.termguicolors = true
		vim.cmd("colorscheme kanagawa")
	end,
}
