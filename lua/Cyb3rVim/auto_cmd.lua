-- NOTE: this makes it easier and more concise to define autocmds
local autocmd = vim.api.nvim_create_autocmd

-- NOTE: Create a highlight group called YankHighlight to use for yanking.
-- guifg defines the foreground color wich will be used for the text color
-- guibg defines the background color which will be used for the text highlight
-- NOTE: this is the same as running highlight in cmd
-- NOTE: with this configuration the text will appear black and the
-- highlight will be cyan/aqua (I like it to be that bright but change
-- if you want it to be a different color)
vim.cmd("highlight YankHighlight guifg=#000000 guibg=#00FFFF")

-- NOTE: we define an autocmd that runs on the event [TextYankPost]
autocmd("TextYankPost", {
	-- NOTE: we give it a description
	desc = "Highlight when yanking text",

	-- NOTE: we add it to a group. this prevents overwriting other autocmd
	-- commands
	group = vim.api.nvim_create_augroup("Cyb3rVim-highlight-yank", { clear = true }),

	-- NOTE: we define the function we want to run when the event is triggered
	callback = function()
		-- NOTE: we call the highlight.on_yank() function and pass it the
		-- highlight group we want to use
		-- we defined the highlight group and the desired colors above
		vim.highlight.on_yank({ higroup = "YankHighlight" })
	end,
})

-- NOTE: remove line numbers for neotree only
autocmd("BufEnter", {
	callback = function()
		if vim.bo.filetype == "neo-tree" then
			vim.cmd("setlocal statuscolumn=")
		end
	end,
})

-- NOTE: This Autocmd will automatically run when the current working
-- directory is changed to check for a project.godot file and if there
-- is one it will start the server for godot dap, and lsp automagically.
-- <leader>sg keymap to launch the server manually
autocmd({ "VimEnter", "DirChanged" }, {
	callback = function()
		local server_address = "127.0.0.1:6004"
		local cwd = vim.fn.getcwd()
		local project_file = cwd .. "/project.godot"
		if vim.fn.filereadable(project_file) == 1 then
			print("Found Godot Project File. Starting Server")
			vim.fn.serverstart("127.0.0.1:6004")
			print(vim.inspect(vim.fn.serverlist()))
		else
			local servers = vim.fn.serverlist()
			for _, server in ipairs(servers) do
				if server == server_address then
					vim.fn.serverstop(server_address)
				end
			end
			print("No Godot Project File found. Foregoeing serverstart")
		end
	end,
})
