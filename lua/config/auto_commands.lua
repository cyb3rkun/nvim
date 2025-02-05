local autocmd = vim.api.nvim_create_autocmd

vim.cmd("highlight YankHighlight guifg=#000000 guibg=#00FFFF")

autocmd("TextYankPost", {
	desc = "Highlight when yanking text",

	group = vim.api.nvim_create_augroup("Cyb3rVim-highlight-yank", { clear = true }),

	callback = function()
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

-- vim.api.nvim_create_augroup("gdscript_keymaps", { clear = true })
-- autocmd({ "FileType" }, {
-- 	group = "gdscript_keymaps",
-- 	pattern = "gdscript",
-- 	callback = function()
-- 		vim.keymap.set("i", "<CR>", function()
-- 			local line = vim.api.nvim_get_current_line()
-- 			if line:match(":%s*$") then
-- 				vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<CR><Tab>", true, true, true), "n", false)
-- 			else
-- 				vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<CR>", true, true, true), "n", false)
-- 			end
-- 		end, { buffer = true })
-- 	end,
-- })
autocmd({ "BufEnter", "BufWinEnter", "BufWinLeave" }, {
	callback = function()
		if vim.bo.filetype == "undotree" then
			print("resize window")
			local max_width = 30
			local win_width = vim.fn.winwidth(0)
			vim.cmd("vertical resize " .. math.min(max_width, win_width))
		end
	end,
})
autocmd({ "BufEnter", "FileType" }, {
	pattern = "html",
	callback = function()
		vim.keymap.set("n", "<LocalLeader>x", function()
			print("opening in browser")
			vim.ui.open(vim.fn.expand("%"))
		end, {
			desc = " Open File In Browser",
		})
	end,
})
autocmd({ "VimEnter" }, {
	callback = function()
		local output = vim.fn.system("kitten @set-background-image ~/Pictures/wallpapers/Lady.png &")
		print(output)
	end,
})
