return {
	{
		"mfussenegger/nvim-dap",
		dependencies = {
			"williamboman/mason.nvim",
			"nvim-neotest/nvim-nio",
		},
		config = function()
			local dap, dapui = require("dap"), require("dapui")
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
			local keymap = vim.keymap.set
			-- Debugging keymaps
			vim.keymap.set("n", "<leader>db", dap.toggle_breakpoint, {
				desc = "Debug: Toggle breakpoint",
			})

			vim.keymap.set("n", "<leader>dc", dap.continue, {
				desc = "Debug: Start/Continue",
			})

			vim.keymap.set("n", "<leader>dj", dap.step_over, {
				desc = "Debug: Step over",
			})

			vim.keymap.set("n", "<leader>dl", dap.step_into, {
				desc = "Debug: Step into",
			})

			vim.keymap.set("n", "<leader>dk", dap.step_out, {
				desc = "Debug: Step out",
			})

			vim.keymap.set("n", "<leader>dr", function()
				dap.run_last()
			end, { desc = "Debug: Run Last" })

			vim.keymap.set("n", "<leader>dx", function()
				dap.terminate()
			end, { desc = "Debug: Terminate" })

			vim.keymap.set("n", "<leader>dr", function()
				dap.run_last()
			end, { desc = "Debug: Run Last" })
			-- NOTE: This keymap is only for rust!
			vim.keymap.set("n", "<leader>dt", "<cmd>lua vim.cmd('RustLsp testables')<CR>", {
				desc = "Debugger Testables",
			})
		end,
	},
	{
		"rcarriga/nvim-dap-ui",
		dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
		config = function()
			require("dapui").setup()
			Keymap("n", "<leader>de", function ()
				require("dapui").eval()
			end)
		end,
	},
}
