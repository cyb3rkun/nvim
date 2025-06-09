return {
	"MagicDuck/grug-far.nvim",
	config = function()
		require("grug-far").setup({})
		local grg = require("grug-far")

		Keymap({ "n" }, "<leader>sr", function()
			grg.open({
				engine = "ripgrep",
			})
		end, { desc = "grug-far: Search within range (ripgrep)" })

		Keymap({ "n", "x" }, "<leader>st", function()
			grg.open({
				engine = "astgrep",
			})
		end, { desc = "grug-far: Search within range (astgrep)" })
	end,
}
