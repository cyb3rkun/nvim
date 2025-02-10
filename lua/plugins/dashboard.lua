return {

	"goolord/alpha-nvim",
	lazy = false,
	dependencies = {
		"nvim-tree/nvim-web-devicons",
		"nvim-lua/plenary.nvim",
	},
	-- WARN: MAKE SURE TO USE JetBrains Mono FONT OR THIS WON'T DISPLAY AS INTENDED
	-- AND ALSO MAKE SURE TO USE CORRECT FONT SIZE OR IT WILL GET RIPPED APART
	-- ALSO ADJUST LINE-AND-CHARACTER SPACING
	config = function()
		-- NOTE: Import Alpha
		local alpha = require("alpha")

		-- NOTE: setup
		local dashboard = require("alpha.themes.dashboard")

		-- CREDIT:
		-- GITHUB: @cyb3rkun
		-- REDDIT: @Cyb3r-Kun
		-- YT: @Cyb3r-Kun
		--
		-- NOTE: I created this header but it's based of one I saw in typecraft_dev's playlist
		-- called [ neovim for newbs ]
		-- YT: @typecraft_dev
		-- YT_VID: https://www.youtube.com/watch?v=iXIwm4mCpuc&list=PLsz00TDipIffreIaUNk64KxTIkQaGguqn&index=5
		dashboard.section.header.val = {
			[[                                                        ]],
			[[                                                        ]],
			[[                                                        ]],
			[[                                                        ]],
			[[       █████████████                ███████         ]],
			[[      █████████████                █   ██         ]],
			[[      ████  ███  ████████████       █████████ ]],
			[[     ████     ██ █  ██  █████████ ██  █ ]],
			[[    ████       ████ ████████      ██████████  ]],
			[[  █████████████ ██  ██  ██   ██ ██   ██   ]],
			[[ ██████████████ █ ████████ ███████████  ██   ]],
			[[ 󰹞󰹞󰹞󰹞󰹞󰹞󰹞󰹞󰹞󰹞󰹞󰹞󰹞󰹞󰹞███󰹞󰹞󰹞󰹞󰹞󰹞󰹞󰹞󰹞󰹞󰹞󰹞󰹞󰹞󰹞󰹞󰹞󰹞󰹞󰹞󰹞󰹞󰹞󰹞󰹞󰹞󰹞󰹞󰹞󰹞󰹞󰹞󰹞󰹞 ]],
			[[                                                        ]],
			[[                ██████                              ]],
			[[                 ███  █  █                          ]],
			[[                 ███ █                                ]],
			[[                 ████ ██ ████                 ]],
			[[                 ████  █  ████                 ]],
			[[                 ███  ██ █████                 ]],
		}
		-- CREDIT:
		-- GITHUB: @RchrdAriza/NvimOnMy_way
		-- R/u/: @Deathgasm_69
		dashboard.section.buttons.val = {
			dashboard.button("n", "   New file", ":ene <BAR> startinsert <CR>"),
			dashboard.button("f", "󰮗   Find file", ":Telescope find_files<CR>"),
			dashboard.button("e", "   File Explorer", ":Neotree<CR>"),
			dashboard.button("r", "   Recent", ":Telescope oldfiles<CR>"),
			dashboard.button("c", "   Configuration", ":e ~/.config/nvim/lua/Cyb3rVim/init.lua<CR>"),
			dashboard.button("R", "󱘞   Ripgrep", ":Telescope live_grep<CR>"),
			dashboard.button("q", "󰗼   Quit", ":qa<CR>"),
		}
		-- NOTE: Send the config to alpha
		alpha.setup(dashboard.opts)

		-- NOTE: Disable folding on alpha buffer
		vim.cmd([[autocmd FileType alpha setlocal nofoldenable]])
	end,
}
