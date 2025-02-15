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
			"nvim-telescope/telescope-file-browser.nvim",
			{
				"nvim-telescope/telescope-fzf-native.nvim",
				build = "make",
			},
		},
		keys = {
			{
				";f",
				function()
					local builtin = require("telescope.builtin")
					builtin.find_files({
						no_ignore = false,
						hidden = true,
					})
				end,
				desc = "Lists files in your current working directory, respects .gitignore",
			},
			{
				";r",
				function()
					local builtin = require("telescope.builtin")
					builtin.oldfiles()
				end,
				desc = "Telescope Recent Files",
			},
			{
				";s",
				function()
					local builtin = require("telescope.builtin")
					builtin.live_grep()
				end,
				desc = "Telescope Live Grep with Preview",
			},
			{
				";b",
				function()
					local builtin = require("telescope.builtin")
					builtin.buffers()
				end,
				desc = "List Open Buffers",
			},
			{
				";;",
				function()
					local builtin = require("telescope.builtin")
					builtin.resume()
				end,
				desc = "Resume the previous telescope picker",
			},
			{
				";e",
				function()
					local builtin = require("telescope.builtin")
					builtin.diagnostics()
				end,
				desc = "List Diagnostics for all open buffers or a specific buffer",
			},
			{
				";t",
				function()
					local builtin = require("telescope.builtin")
					builtin.treesitter()
				end,
				desc = "List Treesitter objects",
			},
			{
				";ws",
				function ()
					local builtin = require("telescope.builtin")
					builtin.lsp_workspace_symbols()
				end
			},
			{
				";wds",
				function ()
					local builtin = require("telescope.builtin")
					builtin.lsp_dynamic_workspace_symbols()
				end
			},
			{
				";sf",
				function()
					local telescope = require("telescope")
					local function telescope_buffer_dir()
						return vim.fn.expand("%:p:h")
					end

					telescope.extensions.file_browser.file_browser({
						path = "%:p:h",
						cwd = telescope_buffer_dir(),
						respect_gitignore = false,
						hidden = true,
						grouped = true,
						previewer = false,
						initial_mode = "normal",
						layout_config = { height = 40 },
					})
				end,
				desc = "Open File Browser with the path of the current buffer",
			},
			{
				";sh",
				function()
					local builtin = require("telescope.builtin")
					builtin.help_tags()
				end,
				desc = "Telescope Help Tags",
			},
			{
				";sd",
				function()
					local builtin = require("telescope.builtin")
					local themes = require("telescope.themes")
					builtin.lsp_document_symbols(themes.get_dropdown({
						layout_strategy = "horizontal",
						layout_config = {
							anchor = "E",
							horizontal = {},
							width = 0.72,
							feight = 0.5,
							preview_width = 0.65,
							prompt_position = "top",
						},
					}))
				end,
				desc = "Telescope LSP Documents Symbols",
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
					initial_mode = "normal",
					layout_config = {
						preview_cutoff = 9999,
					},
				},
			}
			opts.extensions = {
				file_browser = "dropdown",
				hijack_netrw = true,
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
