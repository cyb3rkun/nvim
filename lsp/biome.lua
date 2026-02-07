return {
	-- on_attach = lsp_attach,
	-- capabilities = capabilities,
	cmd = { "biome" },
	filetypes = { "js", "ts", "json" },
	root_markers = { ".luarc.json", ".luarc.jsonc", ".git" },
}
