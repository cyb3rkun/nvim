return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" }, -- NOTE: it's loaded when we open or create a new file

	-- NOTE: here we configure the plugin
	config = function()
		local conform = require("conform") -- NOTE: this should not be necessary

		local formatter_config_dir = vim.fn.stdpath("config")
		.. "/formatters"
		conform.formatters.beautysh = {
			prepend_args = { "-t" },
		}
		conform.formatters.qmlformat = {
			prepend_args = { "-t" },
		}
		-- NOTE: here we run the setup function
		conform.setup({
			log_level = vim.log.levels.DEBUG,
			-- NOTE: here we define which formatters we want to use
			formatters_by_ft = {
				lua = { "stylua" }, -- NOTE: stylua for lua formatting
				c = { "clang-format" }, -- NOTE: clang-format for c cpp and others
				gdscript = { "gdformat" }, -- NOTE: gdformat for gdscript
				csharp = { "clang-format" },
				css = { "biome" },
				json = { "biome" },
				javascript = { "biome" },
				typescript = { "biome" },
				html = { "prettierd" },
				rust = { "rustfmt" },
				cpp = { "clang-format" },
				python = { "ruff_format" },
				bash = { "beautysh" },
				sh = { "beautysh" },
				-- nix = {"nixfmt"}
				nix = { "alejandra" },
			},
			formatters = {
				-- nixfmt = {
				-- 	command = "nixfmt",
				-- 	args = { "--indentation", "tab" },
				-- },
				rustfmt = {
					prepend_args = {
						"--config-path",
						formatter_config_dir .. "/rustfmt.toml",
					},
				},
				["clang-format"] = {
					command = vim.fn.stdpath("data")
						.. "/mason/bin/clang-format",
					prepend_args = {
						"-style=file:"
							.. formatter_config_dir
							.. "/clang-format",
					},
				},
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
			function()
				-- NOTE: here we call the format function from conform and pass it our formatting options
				conform.format({
					lsp_fallback = true,
					async = false,
					timeout_ms = 500,
				})
				vim.api.nvim_exec_autocmds(
					"User",
					{ pattern = vim.bo.filetype }
				)
			end,
			-- NOTE: here we give a description as to what this keymap does
			-- I assume this is useful for when using plugins like which-key
			{ desc = "Format the file or range (in visual mode)" }
		)

		vim.api.nvim_create_autocmd("User", {
			pattern = "qml",
			callback = function ()
				vim.cmd("normal! mz")
				vim.cmd("normal! ggVG=")
				vim.cmd("normal! 'z")
				vim.notify("auto Reindent QML buffer")
			end
		})
	end,
}
