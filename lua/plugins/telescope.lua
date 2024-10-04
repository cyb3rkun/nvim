return {
	{
		'nvim-telescope/telescope.nvim',
		tag = '0.1.8',
		dependencies = {
			'nvim-lua/plenary.nvim',
			{ 'nvim-telescope/telescope-fzf-native.nvim', build = "make" },
			'nvim-tree/nvim-web-devicons',
		},
		config = function()
			-- get telescope and telescope.actions
			local telescope = require('telescope')
			local actions = require('telescope.actions')

			--setup telescope with options
			telescope.setup( {
				defaults = {
					mappings = {
						i = { --Keymaps for insert mode
							["<C-k>"] = actions.move_selection_previous, --move to next selection
							["<C-j>"] = actions.move_selection_next, --move to next selection
							--["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist, --add item to quick fix list and open the quick fix list
						}
					}
				} 
			} )
			telescope.load_extension('fzf')
			local builtin = require('telescope.builtin')

			--set keymaps
			local keymap = vim.keymap --for concciseness

			keymap.set('n', '<leader>pf', builtin.find_files, { desc = "fuzzy find files in cwd"})
			keymap.set('n', '<C-p>', builtin.git_files, { desc = "find git files?"})
			keymap.set('n', '<leader>vh', builtin.help_tags, {})

			keymap.set('n', '<leader>ps', function()
				builtin.grep_string({search = vim.fn.input("Grep > ") })
			end)

			keymap.set('n', '<leader>pws', function()
				local word = vim.fn.expand("<cword>")
				builtin.grep_string({ search = word})
			end)

			keymap.set('n', '<leader>pWs', function()
				local word = vim.fn.expand("<cWORD>")
				builtin.grep_string({ search = word})
			end)
		end
	},
	{
		'nvim-telescope/telescope-ui-select.nvim',
		config = function()
			require('telescope').setup({
				extensions = {
					['ui-select'] = {
						require("telescope.themes").get_dropdown {
						}
					}
				}
			})
			require('telescope').load_extension('ui-select')
		end
	},
	{
		'stevearc/dressing.nvim',
		event = 'VeryLazy',
	}
}
