return {
	"folke/tokyonight.nvim",
	lazy = false,
	priority = 1000,
	opts = {},
	config = function()
		local colors = {
			bg = "",
			bg_dark = "",
			bg_highlight = "",
			bg_search = "",
			bg_visual = "",
			fg = "",
			fg_dark = "",
			fg_gutter = "",
			border = "",
		}
		local config = {
			transparent = true,
			style = "night",
			-- terminal_colors = true,
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
			cache = true,
		}
		require("tokyonight").setup(config)

		vim.o.termguicolors = true
		vim.opt.termguicolors = true
		vim.cmd("colorscheme tokyonight-storm")

		-- slightly transparent crsorline
		vim.api.nvim_set_hl(0, "CursorLine", {
			ctermbg = 16,
			-- bg = "#0f0f0f80",
			-- ctermfg = 16,
			-- blend = 50,
		})
		local CursorLine_augroup = vim.api.nvim_create_augroup("CursorLineTransparency", {
			clear = true,
		})
		vim.api.nvim_create_autocmd("ColorScheme", {
			group = CursorLine_augroup,
			callback = function()
				vim.api.nvim_set_hl(0, "CursorLine", {
					-- bg = nil,
					
					-- ctermbg = 16,
					-- ctermfg = 16,
					-- blend = 50,
				})
			end,
		})
	end,
}
