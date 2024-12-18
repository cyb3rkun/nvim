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
local server_started
autocmd({ "VimEnter", "DirChanged" }, {
	callback = function()
		local server_address = "127.0.0.1:6004"

		local current_working_directory = vim.fn.getcwd() .. "/"
		local root_file_pattern = {
			"project.godot",
			".gdproject",
		}

		for _, root_file_path in ipairs(root_file_pattern) do
			print("looking for: [" .. root_file_path .. "]")
			local file_path = current_working_directory .. root_file_path
			print(file_path)

			if vim.fn.filereadable(file_path) == 1 and not server_started then
				print("Found Godot Project root pattern... Starting LSP")
				vim.fn.serverstart(server_address)
				server_started = true
				return
			else
				vim.fn.serverstop(server_address)
			end
		end
	end,
})
