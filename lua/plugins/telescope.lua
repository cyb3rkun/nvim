-- YT: @joseanmartinez
--
-- YT_VID: https://www.youtube.com/watch?v=6pAG3BHurdM

-- DESC: Telescope is used for Fuzzy Finding and some UI features
return {
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.8",
		dependencies = {
			"nvim-lua/plenary.nvim",
			{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" }, -- NOTE: this plugin is supposed to improve performance
			"nvim-tree/nvim-web-devicons",
		},
		config = function()
			-- NOTE: import telescope and telescope.actions
			local telescope = require("telescope")
			local themes = require("telescope.themes")
			local actions = require("telescope.actions")

			-- NOTE: setup telescope with options
			telescope.setup({
				defaults = {
					path_display = { "smart" },
					sorting_strategy = "ascending",
					layout_config = {
						prompt_position = "top",
						width = 0.7,
						preview_width = 0.65,
					},
					mappings = {
						i = { -- NOTE: Keymaps for insert mode
							["<C-k>"] = actions.move_selection_previous, --move to next selection
							["<C-j>"] = actions.move_selection_next, --move to next selection

							-- NOTE: this mapping is commented out because I still don't completely understand qfl and this will change when I do
							["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist, --add item to quick fix list and open the quick fix list
						},
					},
				},
			})

			-- NOTE: load the fzf performance extension for telescope
			telescope.load_extension("fzf")
			telescope.load_extension("noice")
			local builtin = require("telescope.builtin")

			-- NOTE: in this section we define some keymaps to be used with telescope
			local keymap = vim.keymap.set --for concciseness

			-- NOTE: this keymap is to search for files
			keymap("n", "<leader>pf", builtin.find_files, { desc = "fuzzy find files in cwd" })

			-- NOTE: This will open telescope with the dropdown theme to search through lsp symbols
			keymap("n", "<leader>df", function()
				builtin.lsp_document_symbols(themes.get_dropdown({
					layout_strategy = "horizontal",
					layout_config = {
						anchor = "E",
						horizontal = {},
						width = 0.72,
						height = 0.5,
						preview_width = 0.65,
						prompt_position = "top",
					},
					-- previewer = true,
				}))
			end)

			-- NOTE: this keymap is to find git files
			keymap("n", "<C-p>", builtin.git_files, { desc = "find git files?" })

			-- NOTE: you can use this one to open help tags info and search for some specific items
			-- test it by searching for some vim options like 'signcolumn'
			keymap("n", "<leader>vh", builtin.help_tags, {})

			keymap("n", "<leader>pr", builtin.oldfiles, { desc = " Find recent files" })

			-- NOTE: this one is amazing. it allows you to search for strings inside files
			keymap("n", "<leader>ps", function()
				builtin.grep_string({ search = vim.fn.input("Grep > ") })
			end)

			-- NOTE: search for what you are currently hovering on
			keymap("n", "<leader>pws", function()
				local word = vim.fn.expand("<cword>")
				builtin.grep_string({ search = word })
			end)

			-- NOTE: not entirely sure what this does but believe it also searches for what you are currently hovering on
			keymap("n", "<leader>pWs", function()
				local word = vim.fn.expand("<cWORD>")
				builtin.grep_string({ search = word })
			end)

			-- NOTE: this one is also amazing. it allows you to search for todo comments
			keymap("n", "<leader>ft", "<CMD>TodoTelescope<cr>", { desc = "Find todos" })

			keymap("n", "<leader>bl", builtin.buffers, { desc = "List active buffers" })
		end,
	},

	-- NOTE: I'm not entirely sure what where this is used at the moment
	{
		"nvim-telescope/telescope-ui-select.nvim",
		config = function()
			require("telescope").setup({
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown({}),
					},
				},
			})
			require("telescope").load_extension("ui-select")
		end,
	},
}
