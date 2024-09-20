return {
	--Mason to manage lSPs, linters, formatters and Debug Adapters
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	--Mason add-ons to easily install more lsps, linters formaters etc
	--open mason ui with :Mason
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"lua_ls",
				},
			})
		end,
	},
	--dependencies required? for lsp to function properly
	--some are redundant and might be removed soon for cleaner files
	{
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-cmdline",
		"hrsh7th/nvim-cmp",
	},
	{
		"neovim/nvim-lspconfig",
		config = function()

			local cmp_lsp = require("cmp_nvim_lsp")
			local capabilities = vim.tbl_deep_extend(
				"force",
				{},
				vim.lsp.protocol.make_client_capabilities(),
				cmp_lsp.default_capabilities()
			)

			--lsp setup
			local lspconfig = require("lspconfig")
			-- use lspconfig.[languageServerName].setup({}) to add other languages to the lsp
			--lsp for lua
			lspconfig.lua_ls.setup({})
			lspconfig.gdscript.setup({capabilities = capabilities})

			local is_godot_server_running = false
			--lsp for godot-gdscript (currently not working perfectly but works well enough)
			vim.api.nvim_create_autocmd("BufEnter", {
				group = vim.api.nvim_create_augroup("AutoStartGodotServer", {}),

				callback = function ()
					--get the current working directory and append /project.godot to get a filepath to check if the current working directory is a godot project
					local filepath = vim.fn.getcwd() .. "/project.godot"

					--this function checks if there is a project.godot file in the current working directory to determine if the user is open in a godot project
					--it returns true or false
					local gdproject = function()
						local f=io.open(filepath,"r")
						if f~=nil then io.close(f) return true else return false end
					end

					-- a boolean to keep track of weather or not the server has been started
					-- using this is a simpler method than making a function to check the tcp sockets (I just wasn't feeling like doing that and this is much simpler)

					-- If this is a godot project directory then start the server and the server hasn't been started then start it
					if gdproject() and not is_godot_server_running then
						print(filepath)
						print("gdproject found... Starting server at 127.0.0.1:6004")
						vim.fn.serverstart("127.0.0.1:6004")
						is_godot_server_running = true
					end
				end
			})

			local augroup = vim.api.nvim_create_augroup
			local VoylinGroup = augroup('Voylin', {})
			local autocmd = vim.api.nvim_create_autocmd

			function R(name)
				require('plenary.reload').reload_module(name)
			end

			autocmd('LspAttach', {
				group = VoylinGroup,
				callback = function(e)
					local opts = { buffer = e.buf }
					vim.keymap.set('n', 'gd', function() vim.lsp.buf.definition() end, opts)
					vim.keymap.set('n', '<leader>gd', function() vim.lsp.buf.type_definition() end, opts)
					vim.keymap.set('n', 'gD', function() vim.lsp.buf.declaration() end, opts)
					vim.keymap.set('n', 'gi', function() vim.lsp.buf.implementation() end, opts)
					vim.keymap.set('n', '<leader>k', function() vim.lsp.buf.hover() end, opts)
					vim.keymap.set('n', '<leader>ca', function() vim.lsp.buf.code_action() end, opts)
					vim.keymap.set('n', '<leader>rr', function() vim.lsp.buf.references() end, opts)
					vim.keymap.set('n', '<leader>rn', function() vim.lsp.buf.rename() end, opts)
					vim.keymap.set('n', '<leader>ws', function() vim.lsp.buf.workspace_symbol() end, opts)
					vim.keymap.set('n', '<leader>vd', function() vim.diagnostic.open_float() end, opts)
					vim.keymap.set('i', '<C-h>', function() vim.lsp.buf.signature_help() end, opts)
					vim.keymap.set('i', '<C-k>', function() vim.lsp.buf.hover() end, opts)

					-- Diagnostic keymaps
					vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous [D]iagnostic message' })
					vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next [D]iagnostic message' })
					vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })
					vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })
				end,
			})
		end,
	},
}
