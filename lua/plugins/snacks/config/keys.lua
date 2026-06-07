---@diagnostic disable: undefined-global
-- stylua: ignore
return {
	-- lazygit
	-- Words
	{
		"<leader>w",
		function()
			if Snacks.words.is_enabled() then
				Snacks.words.disable()
				return
			end
			Snacks.words.enable()
		end,
		desc = "toggle snacks.words on and off",
	},
	{ "<localleader>j", function() Snacks.words.jump(1, true) end,      desc = "Go to Previous Snacks Word!", },
	{ "<localleader>k", function() Snacks.words.jump(-1, true) end,     desc = "Go to next Snacks Word!", },
	-- Top Pickers & Explorer
	{ ";<space>",       function() Snacks.picker.smart() end,           desc = "Smart Find Files", },
	{ "<leader>:",      function() Snacks.picker.command_history() end, desc = "Command History", },
	{
		";n",
		function()
			Snacks.picker.notifications({
				win = {
					list = {
						keys = {
							["<C-y>"] = "copy_notifications",
						}
					}
				}
			})
		end,
		desc = "Notification History",
	},
	{ "<leader>e",  function() Snacks.explorer() end,                  desc = "File Explorer", },
	-- find
	{ ";b",         function() Snacks.picker.buffers() end,            desc = "Buffers", },
	{ ";f",         function() Snacks.picker.files() end,              desc = "Find Config File", },
	{ ";g",         function() Snacks.picker.git_files() end,          desc = "Find Git Files", },
	{ ";p",         function() Snacks.picker.projects() end,           desc = "Projects", },
	{ ";r",         function() Snacks.picker.recent() end,             desc = "Recent", },
	-- git
	{ "<leader>lg", function() Snacks.lazygit.open() end,              desc = "Lazy git", },
	{ ";gb",        function() Snacks.picker.git_branches() end,       desc = "Git Branches", },
	{ ";gl",        function() Snacks.picker.git_log() end,            desc = "Git Log", },
	{ ";gL",        function() Snacks.picker.git_log_line() end,       desc = "Git Log Line", },
	{ ";gs",        function() Snacks.picker.git_status() end,         desc = "Git Status", },
	{ ";gS",        function() Snacks.picker.git_stash() end,          desc = "Git Stash", },
	{ ";gd",        function() Snacks.picker.git_diff() end,           desc = "Git Diff (Hunks)", },
	{ ";gf",        function() Snacks.picker.git_log_file() end,       desc = "Git Log File", },
	-- Grep
	{ ";sb",        function() Snacks.picker.lines() end,              desc = "Buffer Lines", },
	{ ";sB",        function() Snacks.picker.grep_buffers() end,       desc = "Grep Open Buffers", },
	{ ";ss",        function() Snacks.picker.grep() end,               desc = "Grep", },
	{ ";sw",        function() Snacks.picker.grep_word() end,          desc = "Visual selection or word", mode = { "n", "x" }, },
	-- search
	{ ";sr",        function() Snacks.picker.registers() end,          desc = "Registers", },
	{ ";s/",        function() Snacks.picker.search_history() end,     desc = "Search History", },
	{ ";sa",        function() Snacks.picker.autocmds() end,           desc = "Autocmds", },
	{ ";sb",        function() Snacks.picker.lines() end,              desc = "Buffer Lines", },
	{ ";sc",        function() Snacks.picker.command_history() end,    desc = "Command History", },
	{ ";sC",        function() Snacks.picker.commands() end,           desc = "Commands", },
	{ ";sd",        function() Snacks.picker.diagnostics() end,        desc = "Diagnostics", },
	{ ";sD",        function() Snacks.picker.diagnostics_buffer() end, desc = "Buffer Diagnostics", },
	{ ";sh",        function() Snacks.picker.help() end,               desc = "Help Pages", },
	{ ";sH",        function() Snacks.picker.highlights() end,         desc = "Highlights", },
	{ ";si",        function() Snacks.picker.icons() end,              desc = "Icons", },
	{ ";sj",        function() Snacks.picker.jumps() end,              desc = "Jumps", },
	{ ";sk",        function() Snacks.picker.keymaps() end,            desc = "Keymaps", },
	{ ";sl",        function() Snacks.picker.loclist() end,            desc = "Location List", },
	{ ";sm",        function() Snacks.picker.marks() end,              desc = "Marks", },
	{ ";sM",        function() Snacks.picker.man() end,                desc = "Man Pages", },
	{ ";sp",        function() Snacks.picker.lazy() end,               desc = "Search for Plugin Spec", },
	{ ";sq",        function() Snacks.picker.qflist() end,             desc = "Quickfix List", },
	{ ";sR",        function() Snacks.picker.resume() end,             desc = "Resume", },
	{ ";su",        function() Snacks.picker.undo() end,               desc = "Undo History", },
	{ ";uC",        function() Snacks.picker.colorschemes() end,       desc = "Colorschemes", },
	-- LSP
	{
		";gd",
		function() Snacks.picker.lsp_definitions() end,
		desc = "Goto Definition",
		nowait = true,
		noremap = true,
	},
	{ "<leader>gD",     function() Snacks.picker.lsp_declarations() end,      desc = "Goto Declaration", },
	{ "<leader>gr",     function() Snacks.picker.lsp_references() end,        nowait = true,                   desc = "References", },
	{ "<leader>gI",     function() Snacks.picker.lsp_implementations() end,   desc = "Goto Implementation", },
	{ "<leader>gy",     function() Snacks.picker.lsp_type_definitions() end,  desc = "Goto T[y]pe Definition", },
	{ "<leader>ds",     function() Snacks.picker.lsp_symbols() end,           desc = "LSP Symbols", },
	{ "<localleader>s", function() Snacks.picker.lsp_workspace_symbols() end, desc = "LSP Workspace Symbols", }
}
