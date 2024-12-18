return {
	"MeanderingProgrammer/markdown.nvim",
	main = "render-markdown",
	opts = {},
	name = "render-markdown", -- NOTE: Only necessary if another plugin with the same name exists
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		require("render-markdown").setup({
			callout = {
				note = { raw = "[!ISEKAI]", rendered = "󰋽 Isekai", highlight = "RenderMarkdownInfo" },
				tip = { raw = "[!FANTASY]", rendered = "󰌶 Fantasy", highlight = "RenderMarkdownSuccess" },
				important = { raw = "[!SCIFI]", rendered = "󰅾 Sci-fi", highlight = "RenderMarkdownHint" },
				warning = { raw = "[!COMEDY]", rendered = "󰀪 Comedy", highlight = "RenderMarkdownWarn" },
				caution = { raw = "[!HORROR]", rendered = "󰳦 Horror", highlight = "RenderMarkdownError" },
				abstract = { raw = "[!PSYCOLOGICAL]", rendered = "󰨸 Psycological", highlight = "RenderMarkdownInfo" },
				summary = { raw = "[!HAREM]", rendered = "󰨸 Harem", highlight = "RenderMarkdownInfo" },
				tldr = { raw = "[!OPMC]", rendered = "󰨸 OP MC", highlight = "RenderMarkdownInfo" },
				info = { raw = "[!AMAZING]", rendered = "󰋽 I Loved this one", highlight = "RenderMarkdownInfo" },
				todo = { raw = "[!TAG]", rendered = "󰗡 Tag", highlight = "RenderMarkdownInfo" },
				hint = { raw = "[!FAV]", rendered = " FAVOURITE", highlight = "RenderMarkdownSuccess" },
				question = { raw = "[!DL]", rendered = "󱆨 Demon Lord Trope", highlight = "RenderMarkdownWarn" },

				success = { raw = "[!SUCCESS]", rendered = "󰄬 Success", highlight = "RenderMarkdownSuccess" },
				check = { raw = "[!CHECK]", rendered = "󰄬 Check", highlight = "RenderMarkdownSuccess" },
				done = { raw = "[!DONE]", rendered = "󰄬 Done", highlight = "RenderMarkdownSuccess" },
				help = { raw = "[!HELP]", rendered = "󰘥 Help", highlight = "RenderMarkdownWarn" },
				faq = { raw = "[!FAQ]", rendered = "󰘥 Faq", highlight = "RenderMarkdownWarn" },
				attention = { raw = "[!ATTENTION]", rendered = "󰀪 Attention", highlight = "RenderMarkdownWarn" },
				failure = { raw = "[!FAILURE]", rendered = "󰅖 Failure", highlight = "RenderMarkdownError" },
				fail = { raw = "[!FAIL]", rendered = "󰅖 Fail", highlight = "RenderMarkdownError" },
				missing = { raw = "[!MISSING]", rendered = "󰅖 Missing", highlight = "RenderMarkdownError" },
				danger = { raw = "[!DANGER]", rendered = "󱐌 Danger", highlight = "RenderMarkdownError" },
				error = { raw = "[!ERROR]", rendered = "󱐌 Error", highlight = "RenderMarkdownError" },
				bug = { raw = "[!BUG]", rendered = "󰨰 Bug", highlight = "RenderMarkdownError" },
				example = { raw = "[!EXAMPLE]", rendered = "󰉹 Example", highlight = "RenderMarkdownHint" },
				quote = { raw = "[!QUOTE]", rendered = "󱆨 Quote", highlight = "RenderMarkdownQuote" },
			},
		})
	end,
}
