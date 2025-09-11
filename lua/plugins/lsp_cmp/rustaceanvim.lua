local rustfmt = require("conform.formatters.rustfmt")
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
					-- arg = {"--all"}
				},
				procMacro = { enable = true }, -- Enable proc-macro support
				diagnostics = {
					enabled = false,
					disabled = { "needless_return", "unlinked-file" },
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
		dependencies = {
			"nvim-neotest/neotest",
		},
		version = "^6.9",
		lazy = false, -- this plugin is already lazy
		config = function()
			require("neotest").setup({
				adapters = {
					require("rustaceanvim.neotest"),
				},
			})
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

			local cfg = require("rustaceanvim.config")
			return {
				dap = {
					adapter = cfg.get_codelldb_adapter(codelldb_path, liblldb_path),
				},
			}
		end,
	},
	{
		"nvim-neotest/neotest",
		dependencies = {
			"nvim-neotest/nvim-nio",
			"nvim-lua/plenary.nvim",
			"antoinemadec/FixCursorHold.nvim",
			"nvim-treesitter/nvim-treesitter",
		},
		config = function()
			Keymap("n", ";t", function()
				local output = require("neotest.consumers.output")
				output.open({
					auto_close = true,
					enter = true,
					open_win = function(opts)
						local t_width = vim.o.columns
						local t_height = vim.o.lines

						local w_width = math.floor(t_width * 0.9)
						local w_height = math.floor(t_height * 0.5)

						local pos_x = math.floor((t_width - w_width) / 2)
						local pos_y = t_height - w_height

						local bufnr = vim.api.nvim_create_buf(false, true)
						---
						---@type vim.api.keyset.win_config
						local win_opts = vim.tbl_deep_extend("force", opts, {
							border = "rounded",
							relative = "editor",
							width = w_width,
							height = w_height,
							col = pos_x,
							row = pos_y,
							style = "minimal",
						})

						vim.api.nvim_open_win(bufnr, true, win_opts)
					end,
				})
			end)
		end,
	},
}
