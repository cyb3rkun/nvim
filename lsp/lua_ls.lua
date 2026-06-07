return {
	cmd = { "lua-language-server" },
	filetypes = { "lua" },
	root_markers = { ".luarc.json", ".luarc.jsonc", ".git" },

	settings = {
		Lua = {
			workspace = {
				library = {
					os.getenv "HOME" .. "/.local/share/lux",
					vim.fn.getcwd()
				},
			},
		},
	},
}
