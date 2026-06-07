return {
	sections = {
		{ section = "header" },
		{
			-- pane = 2,
			section = "keys",
			icon = "󰰉 ",
			title = "Shortcuts",
			indent = 3,
			padding = 1,
			-- gap = 1,
		},
		{
			-- pane = 2,
			icon = " ",
			title = "Projects",
			section = "projects",
			indent = 3,
			padding = 1,
		},
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
				action = ":lua Snacks.explorer()",
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
}
