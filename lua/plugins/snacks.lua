---@diagnostic disable: undefined-global
return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	-- -@type snacks.Config
	opts = {
		-- your configuration comes here
		-- or leave it empty to use the default settings
		-- refer to the configuration section below
		bigfile = { enabled = true },
		-- dashboard = { enabled = true },
		explorer = { enabled = true },
		-- indent = { enabled = true },
		input = { enabled = true },
		picker = {
			enabled = true,
		},
		-- notifier = { enabled = true },
		quickfile = { enabled = true },
		scope = { enabled = true },
		-- scroll = { enabled = true },
		statuscolumn = { enabled = true },
		-- words = { enabled = true },
		image = { enabled = true },
		---@class snacks.dashboard.Config
		---@field enabled? boolean
		---@diagnostic disable-next-line: undefined-doc-name
		---@field sections snacks.dashboard.Section
		---@diagnostic disable-next-line: undefined-doc-name
		---@field formats table<string, snacks.dashboard.Text|fun(item:snacks.dashboard.Item, ctx:snacks.dashboard.Format.ctx):snacks.dashboard.Text>
		dashboard = {
			sections = {
				{ section = "header" },
				-- {
				-- 	pane = 2,
				-- },
				{
					-- pane = 2,
					section = "keys",
					icon = "󰰉 ",
					title = "Shortcuts",
					indent = 3,
					padding = 1,
					-- gap = 1,
				},
				-- {
				-- 	pane = 2,
				-- },
				{
					-- pane = 2,
					icon = " ",
					title = "Projects",
					section = "projects",
					indent = 3,
					padding = 1,
				},
				-- {
				-- 	pane = 2,
				-- },
				{
					-- pane = 2,
					section = "recent_files",
					icon = " ",
					title = "Recent Files",
					indent = 3,
					padding = 1,
				},
				{ section = "startup" },
			},
			preset = {
				keys = {
					{
						icon = " ",
						key = "f",
						desc = "Find file",
						action = ":lua Snacks.dashboard.pick('files')",
					},
					{
						icon = " ",
						key = "n",
						desc = "New file",
						action = ":ene | startinsert",
					},
					{
						icon = " ",
						key = "e",
						desc = "File Explorer",
						action = ":Neotree<cr>",
					},
					{
						icon = " ",
						key = "r",
						desc = "Recent",
						action = ":lua Snacks.dashboard.pick('oldfiles')",
					},
					{
						icon = " ",
						key = "c",
						desc = "Configuration",
						action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})",
					},
					{
						icon = "󱎸 ",
						key = "R",
						desc = "RipGrep",
						action = ":lua Snacks.dashboard.pick('live_grep')",
					},
					{
						icon = "󰗼 ",
						key = "q",
						desc = "Quit",
						action = ":qa",
					},
				},

				header = [[
                                                        
       █████████████                ███████         
      █████████████                █   ██         
      ████  ███  ████████████       █████████ 
     ████     ██ █  ██  █████████ ██  █ 
    ████       ████ ████████      ██████████  
  █████████████ ██  ██  ██   ██ ██   ██   
 ██████████████ █ ████████ ███████████  ██   
 󰹞󰹞󰹞󰹞󰹞󰹞󰹞󰹞󰹞󰹞󰹞󰹞󰹞󰹞󰹞███󰹞󰹞󰹞󰹞󰹞󰹞󰹞󰹞󰹞󰹞󰹞󰹞󰹞󰹞󰹞󰹞󰹞󰹞󰹞󰹞󰹞󰹞󰹞󰹞󰹞󰹞󰹞󰹞󰹞󰹞󰹞󰹞󰹞󰹞 
                                                        
                ██████                              
                 ███  █  █                          
                 ███ █                                
                 ████ ██ ████                 
                 ████  █  ████                 
                 ███  ██ █████                 

				]],
			},

			enabled = true,
		},
	},
	keys = {
		-- Top Pickers & Explorer
		{
			";<space>",
			function()
				Snacks.picker.smart()
			end,
			desc = "Smart Find Files",
		},
		{
			";,",
			function()
				Snacks.picker.buffers()
			end,
			desc = "Buffers",
		},
		{
			";/",
			function()
				Snacks.picker.grep()
			end,
			desc = "Grep",
		},
		{
			";:",
			function()
				Snacks.picker.command_history()
			end,
			desc = "Command History",
		},
		{
			";n",
			function()
				Snacks.picker.notifications()
			end,
			desc = "Notification History",
		},
		{
			";e",
			function()
				Snacks.explorer()
			end,
			desc = "File Explorer",
		},
		-- find
		{
			";b",
			function()
				Snacks.picker.buffers()
			end,
			desc = "Buffers",
		},
		{
			";f",
			function()
				Snacks.picker.files({ cwd = vim.fn.stdpath("config") })
			end,
			desc = "Find Config File",
		},
		-- {
		-- 	";ff",
		-- 	function()
		-- 		Snacks.picker.files()
		-- 	end,
		-- 	desc = "Find Files",
		-- },
		{
			";g",
			function()
				Snacks.picker.git_files()
			end,
			desc = "Find Git Files",
		},
		{
			";p",
			function()
				Snacks.picker.projects()
			end,
			desc = "Projects",
		},
		{
			";r",
			function()
				Snacks.picker.recent()
			end,
			desc = "Recent",
		},
		-- git
		{
			";gb",
			function()
				Snacks.picker.git_branches()
			end,
			desc = "Git Branches",
		},
		{
			";gl",
			function()
				Snacks.picker.git_log()
			end,
			desc = "Git Log",
		},
		{
			";gL",
			function()
				Snacks.picker.git_log_line()
			end,
			desc = "Git Log Line",
		},
		{
			";gs",
			function()
				Snacks.picker.git_status()
			end,
			desc = "Git Status",
		},
		{
			";gS",
			function()
				Snacks.picker.git_stash()
			end,
			desc = "Git Stash",
		},
		{
			";gd",
			function()
				Snacks.picker.git_diff()
			end,
			desc = "Git Diff (Hunks)",
		},
		{
			";gf",
			function()
				Snacks.picker.git_log_file()
			end,
			desc = "Git Log File",
		},
		-- Grep
		{
			";sb",
			function()
				Snacks.picker.lines()
			end,
			desc = "Buffer Lines",
		},
		{
			";sB",
			function()
				Snacks.picker.grep_buffers()
			end,
			desc = "Grep Open Buffers",
		},
		{
			";ss",
			function()
				Snacks.picker.grep()
			end,
			desc = "Grep",
		},
		{
			";sw",
			function()
				Snacks.picker.grep_word()
			end,
			desc = "Visual selection or word",
			mode = { "n", "x" },
		},
		-- search
		{
			";sr",
			function()
				Snacks.picker.registers()
			end,
			desc = "Registers",
		},
		{
			";s/",
			function()
				Snacks.picker.search_history()
			end,
			desc = "Search History",
		},
		{
			";sa",
			function()
				Snacks.picker.autocmds()
			end,
			desc = "Autocmds",
		},
		{
			";sb",
			function()
				Snacks.picker.lines()
			end,
			desc = "Buffer Lines",
		},
		{
			";sc",
			function()
				Snacks.picker.command_history()
			end,
			desc = "Command History",
		},
		{
			";sC",
			function()
				Snacks.picker.commands()
			end,
			desc = "Commands",
		},
		{
			";sd",
			function()
				Snacks.picker.diagnostics()
			end,
			desc = "Diagnostics",
		},
		{
			";sD",
			function()
				Snacks.picker.diagnostics_buffer()
			end,
			desc = "Buffer Diagnostics",
		},
		{
			";sh",
			function()
				Snacks.picker.help()
			end,
			desc = "Help Pages",
		},
		{
			";sH",
			function()
				Snacks.picker.highlights()
			end,
			desc = "Highlights",
		},
		{
			";si",
			function()
				Snacks.picker.icons()
			end,
			desc = "Icons",
		},
		{
			";sj",
			function()
				Snacks.picker.jumps()
			end,
			desc = "Jumps",
		},
		{
			";sk",
			function()
				Snacks.picker.keymaps()
			end,
			desc = "Keymaps",
		},
		{
			";sl",
			function()
				Snacks.picker.loclist()
			end,
			desc = "Location List",
		},
		{
			";sm",
			function()
				Snacks.picker.marks()
			end,
			desc = "Marks",
		},
		{
			";sM",
			function()
				Snacks.picker.man()
			end,
			desc = "Man Pages",
		},
		{
			";sp",
			function()
				Snacks.picker.lazy()
			end,
			desc = "Search for Plugin Spec",
		},
		{
			";sq",
			function()
				Snacks.picker.qflist()
			end,
			desc = "Quickfix List",
		},
		{
			";sR",
			function()
				Snacks.picker.resume()
			end,
			desc = "Resume",
		},
		{
			";su",
			function()
				Snacks.picker.undo()
			end,
			desc = "Undo History",
		},
		{
			";uC",
			function()
				Snacks.picker.colorschemes()
			end,
			desc = "Colorschemes",
		},
		-- LSP
		{
			"<leader>gd",
			function()
				Snacks.picker.lsp_definitions()
			end,
			desc = "Goto Definition",
		},
		{
			"<leader>gD",
			function()
				Snacks.picker.lsp_declarations()
			end,
			desc = "Goto Declaration",
		},
		{
			"<leader>gr",
			function()
				Snacks.picker.lsp_references()
			end,
			nowait = true,
			desc = "References",
		},
		{
			"<leader>gI",
			function()
				Snacks.picker.lsp_implementations()
			end,
			desc = "Goto Implementation",
		},
		{
			"<leader>gy",
			function()
				Snacks.picker.lsp_type_definitions()
			end,
			desc = "Goto T[y]pe Definition",
		},
		{
			"<leader>ss",
			function()
				Snacks.picker.lsp_symbols()
			end,
			desc = "LSP Symbols",
		},
		{
			"<leader>sS",
			function()
				Snacks.picker.lsp_workspace_symbols()
			end,
			desc = "LSP Workspace Symbols",
		},
	},
}
