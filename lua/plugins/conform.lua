return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" }, -- NOTE: it's loaded when we open or create a new file

	-- NOTE: here we configure the plugin
	config = function()
		local conform = require("conform") -- NOTE: this should not be necessary

		-- NOTE: here we run the setup function
		conform.setup({
			-- NOTE: here we define which formatters we want to use
			formatters_by_ft = {
				lua = { "stylua" }, -- NOTE: stylua for lua formatting
				clang = { "clang-format" }, -- NOTE: clang-format for c cpp and others
				gdscript = { "gdformat" }, -- NOTE: gdformat for gdscript
				csharp = { "clang-format" },
				css = { "biome" },
				json = { "biome" },
				javascript = { "biome" },
				typescript = { "biome" },
				html = { "prettierd" },
				rust = { "rustfmt" },
				cpp = { "clang-format" },
			},

			-- NOTE: this will cause it to format a file
			-- when you save

			-- format_on_save = {
			-- 	lsp_fallback = true,
			-- 	async = false,
			-- 	timeout_ms = 500,
			-- },
		})

		-- NOTE: here we set a keybind to format manually
		vim.keymap.set(
			{ "n", "v" },
			"<leader>mp",
			function() -- NOTE: the keymap works in n and v modes and is <leader>mp
				-- NOTE: here we call the format function from conform and pass it our formatting options
				conform.format({
					lsp_fallback = false,
					async = true,
					timeout_ms = 500,
				})
			end,
			-- NOTE: here we give a description as to what this keymap does
			-- I assume this is useful for when using plugins like which-key
			{ desc = "Format the file or range (in visual mode)" }
		)
	end,
}
