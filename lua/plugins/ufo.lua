return {
	"kevinhwang91/nvim-ufo",
	dependencies = "kevinhwang91/promise-async",

	config = function()
		local ufo = require("ufo")
		ufo.setup({
			provider_selector = function(bufnr, filetype, buftype)
				return { "lsp", "indent" }
			end,
		})

		vim.o.foldcolumn = "1"
		vim.o.foldlevel = 99
		vim.o.foldlevelstart = 99
		vim.o.foldenable = true
		local keymap = vim.keymap.set
		keymap("n", "zR", ufo.openAllFolds, { desc = "Open All Code Folds" })
		keymap("n", "zM", ufo.closeAllFolds, { desc = "Close All Code Folds" })

		keymap("n", "zK", function()
			local winid = ufo.peekFoldedLinesUnderCursor()
			if not winid then
				vim.lsp.buf.hover()
			end
		end, { desc = "Peek the Fold under the line" })
	end,
}
