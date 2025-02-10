return {
	{
		"nvim-neorg/neorg",
		event = "VeryLazy",
		-- build = ":Neorg sync-parsers",
		lazy = false, -- Consider changing this
		dependencies = {
			"nvim-lua/plenary.nvim",
			"benlubas/neorg-interim-ls",
		},
		config = function()
			local neorg = require("neorg")
			-- require("blink")
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
							engine = {
								-- NOTE: this is neorg lsp thats completion engine independant
								-- 06 FEB 2025 neorg doesn't support blink
								module_name = "external.lsp-completion",
							},
						},
					},
					["external.interim-ls"] = {
						config = {
							-- default config shown
							completion_provider = {
								-- Enable or disable the completion provider
								enable = true,

								-- Show file contents as documentation when you complete a file name
								documentation = true,

								-- Try to complete categories provided by Neorg Query. Requires `benlubas/neorg-query`
								categories = false,

								-- suggest heading completions from the given file for `{@x|}` where `|` is your cursor
								-- and `x` is an alphanumeric character. `{@name}` expands to `[name]{:$/people:# name}`
								people = {
									enable = false,

									-- path to the file you're like to use with the `{@x` syntax, relative to the
									-- workspace root, without the `.norg` at the end.
									-- ie. `folder/people` results in searching `$/folder/people.norg` for headings.
									-- Note that this will change with your workspace, so it fails silently if the file
									-- doesn't exist
									path = "people",
								},
							},
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
	},
	{
		"benlubas/neorg-interim-ls",
	},
}
