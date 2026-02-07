return {
	"hedyhli/outline.nvim",
	lazy = true,
	cmd = { "Outline", "OutlineOpen" },
	keys = {
		{
			"<leader>o",
			"<cmd>Outline<CR>",
			{ desc = "Toggle Outline" },
		},
	},
	config = function ()
		require("outline").setup({})
	end
}
