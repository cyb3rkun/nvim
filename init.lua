-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system {
		"git",
		"clone",
		"--filter=blob:none",
		"--branch=stable",
		lazyrepo,
		lazypath,
	}
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out, "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Setup lazy.nvim
require("lazy").setup {
	spec = {
		-- import your plugins
		{ import = "plugins" },
		{ import = "plugins.lsp" },
		{ import = "plugins.snacks" },
	},
	-- Configure any other settings here. See the documentation for more details.
	-- colorscheme that will be used when installing plugins.
	-- automatically check for plugin updates
	checker = { enabled = true },
}

require "config"

-- package.path = package.path
-- 	.. ";"
-- 	.. "/home/cyb3r/.local/share/lux/?.lua;./?/init.lua"
-- package.cpath = package.cpath
-- 	.. ";"
-- 	.. "/home/cyb3r/.local/share/lux/?.so;"
-- 	.. "./luxa/?.so;"
--
-- local lx = require("lux")
-- ---@type GlobalOpts
-- local o = {
-- 	global_path = "/home/cyb3r/.config/nvim/"
-- }
-- lx.install_async({{
-- 	"cyb3rkun/lua-json"
-- }}, o)
--
-- local p = package.path
-- local js = require "luxa.json"
-- print(
-- 	js.encode {
-- 		"foo",
-- 		["foobar"] = { "hello", "tata" },
-- 		active = true,
-- 		since = 123546548654.,
-- 	}
-- )
-- local i = p:gmatch "([^;]+)"
-- for path in i do
-- 	print(path)
-- end
