return {
	"nvim-neorg/neorg",
	event = "VeryLazy",
	build = ":Neorg sync-parsers",
	lazy = false, -- Consider changing this
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		local neorg = require("neorg")
		vim.g.maplocalleader = "."
		neorg.setup({
			load = {
				["core.defaults"] = {},
				["core.concealer"] = {
					config = {
						icons = {
							code_block = {
								code_block = {
									conceal = true,
									content_only = true,
								},
							},
						},
					},
				},
				["core.summary"] = {},
				["core.completion"] = {
					config = {
						engine = "nvim-cmp",
					},
				},
				["core.dirman"] = {
					config = {
						workspaces = {
							FullNvimCourse = "/run/media/cyb3rkun/NTFS/CYB3RKUN/FullNvimCourse",
							AnimeList = "/run/media/cyb3rkun/NTFS/vokun/AnimeList/neorg-transposed",
						},
						default_workspace = "FullNvimCourse",
						notes = "~/notes",
						youtube = "~/notes/youtube",
					},
				},
				["core.keybinds"] = {
					neorg_leader = ".",
					default_keybinds = true,
				},
			},
			vim.keymap.set("n", "<localleader>ii", "<CMD>Neorg index<CR>"),
		})
	end,
}
