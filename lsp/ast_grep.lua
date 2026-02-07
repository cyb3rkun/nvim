
return{
	-- these are the default options, you only need to specify
	-- options you'd like to change from the default
	cmd = { "ast-grep", "lsp" },
	filetypes = {
		"c",
		"cpp",
		"rust",
		"go",
		"java",
		"python",
		"javascript",
		"typescript",
		"html",
		"css",
		"kotlin",
		"dart",
		"lua",
	},
	-- root_dir = require("lspconfig.util").root_pattern("sgconfig.yaml", "sgconfig.yml"),
	root_markers = {},
}
