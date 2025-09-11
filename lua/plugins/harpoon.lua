return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	dependencies = { "nvim-lua/plenary.nvim" },

	-- NOTE: here we setup ThePrimeagen's harpoon plugin
	-- I'm still trying to get this to work with the telescope ui
	config = function()
		local harpoon = require("harpoon")
		harpoon:setup({})
		local Path = require("plenary").path
		local snacks = require("snacks")
		-- TODO: implement snack picker for harpoon hooks

		-- local function toggle_snacks(harpoon_files)
		-- 	local cb_idx = 1
		-- 	local cb_path = Path:new(vim.api.nvim_buf_get_name(0)):make_relative()
		-- 	local initial_selection_index = 1
		--
		-- 	local items = {}
		-- 	for idx, item in ipairs(harpoon_files.items) do
		-- 		local file_path = item.value
		-- 		local relative_path = Path:new(file_path):make_relative()
		-- 		table.insert(items, {
		-- 			text = idx .. " " .. relative_path,
		-- 			value = file_path,
		-- 			index = idx,
		-- 		})
		--
		-- 		if cb_path == relative_path then
		-- 			initial_selection_index = idx
		-- 		end
		-- 	end
		-- 	snacks.picker({
		-- 		title = "Harpoon Snacks",
		-- 		items = items,
		-- 		initial_selection = initial_selection_index,
		-- 		format = function(item, _)
		-- 			return { { item.text, "SnacksPickerText" } }
		-- 		end,
		-- 		confirm = function(picker, item)
		-- 			picker:close()
		-- 			vim.cmd("edit " .. item.value)
		-- 		end,
		-- 	})
		-- end

		local keymap = vim.keymap.set

		-- keymap("n", "<C-e>", function()
		-- 	toggle_snacks(harpoon:list())
		-- end, { desc = "Open Harpoon Snacks Picker" })
		
		-- keymap("n", "<C-e>", function()
		-- 	toggle_telescope(harpoon:list())
		-- end, { desc = "Open Harpoon Telescope" })

		keymap("n", "<C-e>", function ()
			harpoon.ui:toggle_quick_menu(harpoon:list())
		end, { desc = "Open Harpoon quick Menu"})
		keymap("n", "<leader>a", function()
			harpoon:list():add()
		end)

		for i = 1, 9 do
			keymap("n", "<leader>" .. i, function()
				harpoon:list():select(i)
			end, {
				desc = "Go to " .. (function(n)
					local suffix = { "st", "nd", "rd" }
					return n .. (suffix[n] or "th")
				end)(i) .. " harpoon hook",
			})
		end
	end,
}

