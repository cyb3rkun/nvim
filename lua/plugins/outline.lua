return {
	"hedyhli/outline.nvim",
	lazy = true,
	cmd = { "Outline", "OutlineOpen" },
	config = function() require("outline").setup {} end,
	keys = {
		{
			"<leader>o",
			function() require("outline").toggle_outline() end,
			"Toggle outline",
		},
	},
}
