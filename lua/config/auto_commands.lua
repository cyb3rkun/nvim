local autocmd = vim.api.nvim_create_autocmd

vim.cmd("highlight YankHighlight guifg=#000000 guibg=#00FFFF")
vim.cmd(
	"highlight YankHighlightClipboard guifg=#1d202f guibg=#ff9e64"
)

autocmd("TextYankPost", {
	desc = "Highlight when yanking text",

	group = vim.api.nvim_create_augroup("Cyb3rVim-highlight-yank", {
		clear = true,
	}),

	callback = function()
		local reg = vim.v.register

		local hgroup = "YankHighlight"
		if reg == "+" or reg == "*" then
			hgroup = "YankHighlightClipboard"
		end
		vim.highlight.on_yank({
			higroup = hgroup,
		})
	end,
})
autocmd("ColorScheme", {
	group = vim.api.nvim_create_augroup(
		"Cyb3rVim-custom-highlights",
		{ clear = true }
	),
	callback = function()
		vim.cmd("highlight YankHighlight guifg=#000000 guibg=#00FFFF")
		vim.cmd(
			"highlight YankHighlightClipboard guifg=#1d202f guibg=#ff9e64"
		)
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
local server_address
autocmd({ "VimEnter", "DirChanged" }, {
	callback = function()
		print("found GDProject")
		-- change the order of these to change the priority
		local root_pattern = {
			".gdproject",
			"project.godot",
		}
		local root_file = nil
		local root_dir = nil

		for _, pattern in ipairs(root_pattern) do
			local found = vim.fs.find(pattern, { upward = true, stop = vim.env.HOME })

			if #found > 0 then
				vim.notify("Found GDproject")
				root_file = found[1]
				root_dir = vim.fs.dirname(root_file)
				break
			end
		end

		if root_dir and not server_started then
			server_address = root_dir .. "/godothost"
			--safety
			if not root_file then return end

			if root_file:match("%.gdproject$") then
				local f = io.open(root_file, "r")
				if f then
					local line = f:read("*l")
					f:close()
					print("Project_File: " .. line)
					local name = line:match("=%s*(%S+)") or line:match("(%S+)")
					if name then
						print(name)
						server_address = root_dir .. "/" .. name .. "/godothost"
					end
				end
			end
		end
		print(server_address)

		if server_started then
			vim.fn.serverstop(server_address)
		else
			local success = pcall(vim.fn.serverstart, server_address)
			if success then
				vim.notify("Godot Server started @: " .. server_address)
				server_started = true
			end
		end
	end,
})
autocmd("VimLeave", {
	callback = function ()
		if server_started then
			vim.fn.serverstop(server_address)
		end
	end
})

autocmd({ "BufWinLeave" }, {
	pattern = "?*",
	callback = function() vim.cmd("mkview") end,
})
autocmd({ "BufWinEnter" }, {
	pattern = "?*",
	callback = function() vim.cmd("silent! loadview") end,
})

autocmd({ "BufEnter", "BufWinEnter", "BufWinLeave" }, {
	callback = function()
		if vim.bo.filetype == "undotree" then
			print("resize window")
			local max_width = 30
			local win_width = vim.fn.winwidth(0)
			vim.cmd(
				"vertical resize " .. math.min(max_width, win_width)
			)
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
