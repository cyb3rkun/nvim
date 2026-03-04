return {
	"olimorris/codecompanion.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-treesitter/nvim-treesitter",

		"saghen/blink.cmp",
	},
	opts = {
		opts = {
			log_level = "DEBUG"
		},
		strategies = {
			chat = {
				adapter = "gemini",
			},
			inline = {
				adapter = "gemini"
			}
		},
		gemini = function()
			return require("codecompanion.adapters").extend("gemini", {
				schema = {
					model = {
						default = "gemini-2.5-flash-preview",
					},
				},
				env = {
					api_key = os.getenv("GEMINI_API_KEY"),
				},
			})
		end,
		display = {
			chat = {
				window = {
					position = "right",
					width = 88,
				},
			},
		},
		adapters = {
			http = {
				gemini = function()
					return require("codecompanion.adapters").extend("gemini", {
						env = {
							api_key = os.getenv("GEMINI_API_KEY"),
							model = "gemini-2.5-flash"
						},
						schema = {
							model = {
								default = "gemini-2.5-flash",
							},

						},
					})
				end,
			}
		},
		interactions = {
			chat = {
				adapter =   "gemini",
			},
			inline = {
				adapter = "gemini",
			},
			cmd = {
				adapter = "llama.cpp",
			},
			background = {
				enabled = false,
				adapter = "llama.cpp",
			}
		},
	},
}
