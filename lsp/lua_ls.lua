return {
	cmd = { "lua-language-server" },
	root_markers = { ".luarc.json", ".luarc.jsonc", ".git" },
	filetypes = { "lua" },

	settings = {
		Lua = {
			runtime = {
				version = "Lua 5.4",
				path = {
					"?.lua",
					"?/init.lua",
					vim.fn.expand("~/.luarocks/share/lua/5.4/?.lua"),
					vim.fn.expand("~/.luarocks/share/lua/5.4/?/init.lua"),
					"/usr/share/5.4/?.lua",
					"/usr/share/lua/5.4/?/init.lua",
				},
			},
			workspace = {
				library = {
					vim.fn.expand("~/.luarocks/share/lua/5.4"),
					"/usr/share/lua/5.4",
				},
			},
		},
	},
}
