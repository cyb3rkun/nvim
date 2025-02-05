return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	dependencies = { "nvim-lua/plenary.nvim" },

	-- NOTE: here we setup ThePrimeagen's harpoon plugin
	-- I'm still trying to get this to work with the telescope ui
	config = function()
		local harpoon = require("harpoon")
		harpoon:setup({})

		local keymap = vim.keymap.set
		keymap("n", "<leader>a", function()
			harpoon:list():add()
		end)

		keymap("n", "<C-e>", function()
			harpoon.ui:toggle_quick_menu(harpoon:list())
		end)

		keymap("n", "<leader>1", function()
			harpoon:list():select(1)
		end, { desc = "Go to first harpoon hook" })
		keymap("n", "<leader>2", function()
			harpoon:list():select(2)
		end, { desc = "Go to second harpoon hook" })
		keymap("n", "<leader>3", function()
			harpoon:list():select(3)
		end, { desc = "Go to third harpoon hook" })
		keymap("n", "<leader>4", function()
			harpoon:list():select(4)
		end, { desc = "Go to fourth harpoon hook" })
	end,
}
