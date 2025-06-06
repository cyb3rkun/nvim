return {
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.8",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope-file-browser.nvim",
			{
				"nvim-telescope/telescope-fzf-native.nvim",
				build = "make",
			},

			"folke/noice.nvim",
		},
		keys = {
			{
				";f",
				function()
					local telescope = require("telescope")
					local function telescope_buffer_dir()
						return vim.fn.expand("%:p:h")
					end

					telescope.extensions.file_browser.file_browser({
						cwd = vim.fn.getcwd(-1, -1),
						cwd_to_path = false,
						respect_gitignore = false,
						hidden = false,
						grouped = true,
						depth = 10,
						previewer = true,
						initial_mode = "insert",
						layout_config = {
							height = 40,
							preview_width = 20,
						},
					})
				end,
				desc = "Open File Browser with the path of the current buffer",
			},
			{
				";r",
				function()
					local builtin = require("telescope.builtin")
					builtin.oldfiles({ initial_mode = "insert" })
				end,
				desc = "Telescope Recent Files",
			},
			{
				";ss",
				function()
					local builtin = require("telescope.builtin")
					builtin.live_grep({})
				end,
				desc = "Telescope Live Grep with Preview",
			},
			{
				";#",
				function()
					local builtin = require("telescope.builtin")
					local word = vim.fn.expand("<cword>")
					builtin.grep_string({
						initial_mode = "insert",
						search = word,
					})
				end,
			},
			{
				";b",
				function()
					local builtin = require("telescope.builtin")
					builtin.buffers({ initial_mode = "insert" })
				end,
				desc = "List Open Buffers",
			},
			{
				";;",
				function()
					local builtin = require("telescope.builtin")
					builtin.resume({ initial_mode = "insert" })
				end,
				desc = "Resume the previous telescope picker",
			},
			{
				";e",
				function()
					local builtin = require("telescope.builtin")
					builtin.diagnostics({ initial_mode = "insert" })
				end,
				desc = "List Diagnostics for all open buffers or a specific buffer",
			},
			{
				";t",
				function()
					local builtin = require("telescope.builtin")
					builtin.treesitter({ initial_mode = "insert" })
				end,
				desc = "List Treesitter objects",
			},
			{
				";ws",
				function()
					local builtin = require("telescope.builtin")
					builtin.lsp_workspace_symbols({ initial_mode = "insert" })
				end,
			},
			{
				";wds",
				function()
					local builtin = require("telescope.builtin")
					builtin.lsp_dynamic_workspace_symbols({ initial_mode = "insert" })
				end,
			},
			{
				";sf",
				function()
					local builtin = require("telescope.builtin")
					builtin.find_files({
						-- initial_mode = "insert",
						no_ignore = false,
						hidden = true,
					})
				end,
				desc = "Lists files in your current working directory, respects .gitignore",
			},
			{
				";sh",
				function()
					local builtin = require("telescope.builtin")
					builtin.help_tags({ initial_mode = "insert" })
				end,
				desc = "Telescope Help Tags",
			},
			{
				";sd",
				function()
					local builtin = require("telescope.builtin")
					local themes = require("telescope.themes")
					builtin.lsp_document_symbols(themes.get_dropdown({
						layout_strategy = "vertical",
						layout_config = {
							-- anchor = "E",
							width = 0.72,
							height = 0.8,
							preview_height = 0.50,
							prompt_position = "top",
						},
					}))
				end,
				desc = "Telescope LSP Documents Symbols",
			},
			{
				";sx",
				function()
					local builtin = require("telescope.builtin")
					-- local  = require("telescope.builtin")
					builtin.quickfix({ initial_mode = "insert" })
				end,
			},
			{
				";st",
				"<CMD>TodoTelescope<cr>",
				desc = "Telescope Todo Comments",
			},
		},
		config = function(_, opts)
			local telescope = require("telescope")
			local actions = require("telescope.actions")
			local fb_actions = require("telescope").extensions.file_browser.actions

			opts.defaults = vim.tbl_deep_extend("force", opts, {
				wrap_results = true,
				layout_strategy = "horizontal",
				layout_config = { prompt_position = "bottom" },
				sorting_strategy = "ascending",
				winblend = 0,
				mappings = {
					n = {},
				},
			})
			opts.pickers = {
				diagnostics = {
					initial_mode = "insert",
					layout_config = {
						preview_cutoff = 9999,
					},
				},
			}
			opts.extensions = {
				file_browser = "dropdown",
				hijack_netrw = true,
				cwd = vim.fn.getcwd(),
				mappings = {
					["n"] = {
						["N"] = fb_actions.create,
						["h"] = fb_actions.goto_parent_dir,
						["<C-u>"] = function(prompt_buffnr)
							for i = 1, 10 do
								actions.move_selection_previous(prompt_buffnr)
							end
						end,
						["<C-d>"] = function(prompt_buffnr)
							for i = 1, 10 do
								actions.move_selection_next(prompt_buffnr)
							end
						end,
					},
				},
			}
			telescope.setup({
				defaults = {
					path_display = { "smart" },
					sorting_strategy = "ascending",
					layout_config = {
						prompt_position = "bottom",
						width = 0.7,
						-- preview_width = 0.65,
					},
					mappings = {
						i = {
							["<C-k>"] = actions.move_selection_previous, --move to next selection

							["<C-j>"] = actions.move_selection_next, --move to next selection

							-- NOTE: this mapping is commented out because I still don't completely understand qfl and this will change when I do
							["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist, --add item to quick fix list and open the quick fix list
							["<C-b>"] = actions.preview_scrolling_up,
							["<C-f>"] = actions.preview_scrolling_down,
						},
					},
				},
				opts,
			})
			telescope.load_extension("fzf")
			telescope.load_extension("noice")
			telescope.load_extension("ui-select")
			telescope.load_extension("file_browser")
		end,
	},
	-- NOTE: I'm not entirely sure what where this is used at the moment
	{
		"nvim-telescope/telescope-ui-select.nvim",
		config = function()
			local telescope = require("telescope")
			telescope.setup({
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown({}),
					},
				},
			})
			telescope.load_extension("ui-select")
		end,
	},
}
