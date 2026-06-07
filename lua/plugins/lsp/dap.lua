return {
	{
		"rcarriga/nvim-dap-ui",
		dependencies = {
			"mfussenegger/nvim-dap",
			"nvim-neotest/nvim-nio",
		},
		keys = {
			{
				"<leader>de",
				function() require("dapui").eval() end,
				mode = { "n" },
				desc = "Open dap ui",
			},
		},
	},
	{
		"mfussenegger/nvim-dap",
		dependencies = {
			"williamboman/mason.nvim",
			"nvim-neotest/nvim-nio",
		},
		config = function()
			local dap, dapui = require "dap", require "dapui"
			dap.listeners.before.attach.dapui_config = function()
				dapui.open()
			end
			dap.listeners.before.launch.dapui_config = function()
				dapui.open()
			end
			dap.listeners.before.event_terminated.dapui_config = function()
				dapui.open()
			end
			dap.listeners.before.event_exited.dapui_config = function()
				dapui.open()
			end
			-- Godot stuff
			dap.adapters.godot = {
				type = "server",
				host = "127.0.0.1",
				port = 6006,
			}

			dap.configurations.gdscript = {
				{
					type = "godot",
					request = "launch",
					name = "Launch scene",
					project = "${workspaceFolder}/",
					launch_scene = true,
				},
			}
			-- local keymap = vim.keymap.set
			-- Debugging keymaps
		end,
		keys = {
			{
				"<leader>db",
				function() require("dap").toggle_breakpoint() end,
				desc = "Debug: Toggle breakpoint",
			},

			{
				"<leader>dc",
				function() require("dap").continue() end,
				desc = "Debug: Start/Continue",
			},

			{
				"<leader>dj",
				function() require("dap").step_over() end,
				desc = "Debug: Step over",
			},

			{
				"<leader>dl",
				function() require("dap").step_into() end,
				desc = "Debug: Step into",
			},

			{
				"<leader>dk",
				function() require("dap").step_out() end,
				desc = "Debug: Step out",
			},

			{
				"<leader>dr",
				function() require("dap").run_last() end,
				mode = { "n" },
				desc = "Debug: Run Last",
			},

			{
				"<leader>dx",
				function() require("dap").terminate() end,
				mode = { "n" },
				desc = "Debug: Terminate",
			},

			{
				"<leader>dr",
				function() require("dap").run_last() end,
				mode = { "n" },
				desc = "Debug: Run Last",
			},
			-- NOTE: This keymap is only for rust!
			{
				"<leader>dt",
				"<cmd>lua vim.cmd('RustLsp testables')<CR>",
				mode = { "n" },
				desc = "Debugger Testables",
			},
		},
	},
}
