return {
	-- CREDIT:
	-- GITHUB: @folke
	"folke/todo-comments.nvim",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = { "nvim-lua/plenary.nvim" },

	opts = {
		signs = true,
		sign_priority = 8,

		keywords = {
			FIX = {
				icon = " ",
				color = "error",
				alt = { "FIXME", "BUG", "FIXIT", "ISSUE" },
			},

			-- WARN: @ symbol cannot be used in todo-comment tag
			TODO = { icon = " ", color = "info" },
			HACK = { icon = " ", color = "warning" },
			WARN = { icon = " ", color = "warning", alt = { "WARNING", "XXX" } },
			PERF = { icon = " ", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
			NOTE = { icon = " ", color = "hint", alt = { "INFO" } },
			TEST = { icon = "⏲ ", color = "test", alt = { "TESTING", "PASSED", "FAILED" } },
			CREDIT = {
				icon = " ", -- NOTE: we define an icon to be used for this tag
				color = "#00FFFF", -- NOTE: we define a color to be used for this tag
				alt = { -- NOTE: we define alternative tags that should use the same icon and color
					"COMMEND",
					"ATTRIBUTE",
					"ACKNOWLADGEMENT",
					"HAT_TIP",
					"RECOGNITION",
					"KUDOS",
					"CREDENCE_TO",
					"SPECIAL_THANKS_TO",
				},
			},
			SUBSEKTION = {
				icon = "󰚟",
				color = "#0093AF",
				alt = {
					"SUBHEADING",
					"SUBCATEGORY",
				},
			},
			SECTION = {
				icon = "󰚟",
				color = "#007FFF",
				alt = {
					"HEADING",
					"LABEL",
					"CATEGORY",
				},
			},

			-- NOTE: some tags I use to give credit to people from whoms configs I took snippets
			YT = { icon = "󰗃 ", color = "#FF0000", alt = { "YT_VID", "YT_CHANNEL" } },
			REDDIT = { icon = " ", color = "#FF4500", alt = { "REDDITOR", "R/u/", "REDDIT" } },
			INSTAGRAM = { icon = "󰋾 ", color = "#5B51D8", alt = { "INSTA" } },
			X = { icon = " ", color = "#FFFFFF", alt = { "TWITTER", "TWEET" } },
			GITHUB = { icon = " ", color = "#FFFFFF", alt = { "GIT" } },
			DESC = { icon = "󰈙", color = "#CB9D06", alt = { "DESCRIPTION", "EXPLANATION", "EXPLAIN" } },
		},

		-- NOTE: here we define some highlighting options for our tags
		highlight = {
			multiline = true, -- NOTE: Allow multiline comments to be highlighted
			multiline_pattern = "^.",
			multiline_context = 10, -- NOTE: I believe this defines how many lines a multiline comment can be

			-- NOTE: this controls the highlighting for everything that is before the comment tag.
			-- fg will cause it to be highlighted the same color as the tag
			before = "",
			keyword = "wide",
			after = "fg", -- NOTE: this controls the highlighting for whatever comes after the tag
			pattern = [[.*(KEYWORDS)\s*:]], -- NOTE: this is the vim regex pattern used to find todo-comments
			comments_only = true,
			max_line_len = 400,
			exclude = {}, -- NOTE: List of filetypes to exclude
			throttle = 200, -- NOTE: no documentation on what this does though I would assume it's for optimization reasonsi WARN:
		},
	},
}
