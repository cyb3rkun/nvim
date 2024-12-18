return {
	"gbprod/substitute.nvim",
	event = { "BufReadPre", "BufNewFile" },

	config = function()
		local substitute = require("substitute")

		substitute.setup()

		local keymap = vim.keymap.set

		keymap("n", "q", substitute.operator, { desc = "Substitute with motion" })
		keymap("n", "qq", substitute.line, { desc = "Substitute line" })
		keymap("n", "Q", substitute.eol, { desc = "Substitute to end of line" })
		keymap("x", "q", substitute.line, { desc = "Substitute in visual mode" })
	end,
}
