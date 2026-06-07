return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	dependencies = { "nvim-lua/plenary.nvim" },

	keys = function()
		local keys = {
			{
				"<C-e>",
				function()
					local h = require "harpoon"
					h.ui:toggle_quick_menu(h:list())
				end,
				mode = { "n" },
				desc = "toggle harpoon quick menu",
			},
			{
				"<leader>a",
				function()
					local h = require "harpoon"
					h:list():add()
				end,
				mode = { "n" },
				desc = "Add file to Harpoon hooks",
			},
		}
		local suffix = { "st", "nd", "rd" }
		for i = 1, 9 do
			keys[#keys + 1] = {
				"<leader>" .. i,
				function() require("harpoon"):list():select(i) end,
				mode = "n",
				desc = "Go to "
					.. i
					.. (suffix[i] or "th")
					.. " harpoon hook",
			}
		end

		return keys
	end,
	-- keys = {
	-- },
}
