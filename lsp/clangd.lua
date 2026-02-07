return {
	-- capabilities = capabilities,
	-- on_attach = function ()
	--
	-- end,

	cmd = { "clangd" },

	filetypes = { "c", "cpp", "objc", "objcpp", "cuda", "proto" },

	root_markers = {
		"main.c",
		".clang-format",
		".editor-config",
		".compile-commands.json",
		".compile-flags.txt",
		".configure.ac",
		".git",
		"project.godot",
	},
	single_file_support = true,
}
