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
				checkOnSave = true,

				check = {
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
		ft = "rust",
		version = "^9",
		-- lazy = false, -- this plugin is already lazy
	},
}
