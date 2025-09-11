return {
	"folke/tokyonight.nvim",
	lazy = false,
	priority = 1000,
	dependencies = {
		{
			"lukas-reineke/virt-column.nvim",
			opts = {},
			config = function()
				require("virt-column").setup({
					char = "⎸",
					-- highlight = "error"
				})
			end,
		},
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
				colors.bg_dark = colors.none
				-- colors.bg_dark1 = colors.none
				-- P(colors)
			end,

			cache = true,
		}
		require("tokyonight").setup(config)

		vim.o.termguicolors = true
		vim.opt.termguicolors = true
		vim.cmd("colorscheme tokyonight-storm")

		vim.g.virtcolumn_char = "⎸"
		vim.g.virtcolumn_priority = 0
		-- / Inline Type hints!
		vim.api.nvim_set_hl(0, "LspInlayHint", {
			-- undercurl = true,
			-- underdotted = true,
			-- underdashed = true,
			-- underline = true,
			underdouble = true,
			-- strikethrough = true,
			-- reverse = false,
			-- nocombine = true,
			-- italic = true,
			-- altfont = false,

			fg = "#8a9fab",
			-- link = "DiagnosticInfo",
		})
		vim.lsp.inlay_hint.enable(true)

		vim.api.nvim_set_hl(0, "CursorLine", {
			underline = true,
			-- fg = "#2b2b2b"
			--
		})
		vim.api.nvim_set_hl(0, "Folded", {
			underline = true,
			bg = nil,
			--
		})
		vim.api.nvim_set_hl(0, "ColorColumn", {
			bg = nil,
			fg = nil,
			-- "#000000",
		})
	end,
}
