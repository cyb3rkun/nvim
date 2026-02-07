local rustfmt = require "conform.formatters.rustfmt"
vim.g.rustaceanvim = {
	tools = {
		-- Enable hover actions
		hover_actions = {
			auto_focus = false,
		},
		-- Use neotest for running tests
		test_executor = "neotest",
	},
	-- LSP configuration
	server = {
		on_attach = function(client, bufnr)
			-- Custom keymaps
			vim.keymap.set("n", "<leader>ca", function()
				vim.cmd.RustLsp("codeAction")
			end, { buffer = bufnr, desc = "Code Action" })
			vim.keymap.set("n", "<leader>dr", function()
				vim.cmd.RustLsp("debuggables")
			end, { buffer = bufnr, desc = "Rust Debuggables" })
		end,
		default_settings = {
			["rust-analyzer"] = {
				cargo = {
					allFeatures = true, -- Enable all Cargo features
					buildScripts = { enable = true },
				},
				checkOnSave = {
					command = "clippy", -- Use clippy for linting
				},
				procMacro = { enable = true }, -- Enable proc-macro support
				diagnostics = {
					enabled = false,
					disabled = { "needless_return" },
					experimental = {
						enabled = true,
					},
				},
			},
		},
	},
	-- DAP configuration
	dap = {
		autoload_configurations = true, -- Automatically load debug configurations
	},
}
return {
	{
		"mrcjkb/rustaceanvim",
		version = "^6",
		lazy = false, -- this plugin is already lazy
		config = function()
			local extension_path = vim.fn.expand("$MASON/packages/codelldb")
			local codelldb_path = extension_path .. "/extension"
			local liblldb_path = codelldb_path .. "/lldb/lib/liblldb"
			local this_os = vim.uv.os_uname().sysname

			-- The path is different on Windows
			if this_os:find("Windows") then
				codelldb_path = extension_path .. "adapter\\codelldb.exe"
				liblldb_path = extension_path .. "lldb\\bin\\liblldb.dll"
			else
				-- The liblldb extension is .so for Linux and .dylib for MacOS
				liblldb_path = liblldb_path .. (this_os == "Linux" and ".so" or ".dylib")
			end

			-- print(liblldb_path)
			local cfg = require("rustaceanvim.config")
			return {
				dap = {
					adapter = cfg.get_codelldb_adapter(codelldb_path, liblldb_path),
				},
			}
		end,
	},
}
