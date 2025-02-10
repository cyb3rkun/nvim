return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	dependencies = { "nvim-lua/plenary.nvim" },

	-- NOTE: here we setup ThePrimeagen's harpoon plugin
	-- I'm still trying to get this to work with the telescope ui
	config = function()
		local harpoon = require("harpoon")
		harpoon:setup({})

		local function toggle_telescope(harpoon_files)
			local get_finder = function()
				local file_paths = {}
				for _, item in ipairs(harpoon_files.items) do
					table.insert(file_paths, item.value)
				end
				return require("telescope.finders").new_table({
					results = file_paths,
				})
			end
			local conf = require("telescope.config").values

			require("telescope.pickers")
				.new({}, {
					prompt_title = "Harpoon",
					finder = get_finder(),
					-- previewer = require("telescope.config").generic_previewer({}),
					sorter = conf.generic_sorter({}),
					-- previewer = true,
					previewer = conf.file_previewer({}),

					initial_mode = "normal",

					layout_strategy = "horizontal",
					layout_config = {
						-- mirror = true,
						-- anchor = "S",
						-- horizontal = {},
						width = 0.99,
						height = 0.5,
						preview_width = 0.50,
						prompt_position = "bottom",
					},
					attach_mappings = function(prompt_bufnr, map)
						local state = require("telescope.actions.state")
						map("n", "<c-d>", function()
							local harpoon_list = harpoon:list()
							local selected_entry = state.get_selected_entry()
							-- local current_picker = state.get_current_picker(prompt_bufnr)

							table.remove(harpoon:list().items, selected_entry.index)
							-- harpoon:list():remove_at(selected_entry.index)

							vim.defer_fn(function()
								toggle_telescope(harpoon_list)
							end, 50)
						end)
						return true
					end,
				})
				:find()
		end
		local keymap = vim.keymap.set
		keymap("n", "<C-e>", function()
			toggle_telescope(harpoon:list())
		end, { desc = "Open Harpoon Telescope" })
		keymap("n", "<leader>a", function()
			harpoon:list():add()
		end)

		-- keymap("n", "<C-a>", function()
		-- 	harpoon.ui:toggle_quick_menu(harpoon:list())
		-- end)
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
