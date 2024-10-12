-- DESCRIPTION: keymaps for lsp functionality is defined in this file and used in lspconfig.lua

-- CREDIT:
-- YT: @joseanmartinez
-- YT_VID: https://www.youtube.com/watch?v=6pAG3BHurdM
-- GITHUB: @Geerayef/Dotfiles
-- https://github.com/Geerayef/Dotfiles/blob/6dd72f17130a8d5f76b5a919594990c8497cc4b9/.config/nvim/lua/plugins/lsp.lua

-- For cinciseness
local keymap = vim.keymap.set
-- NOTE: using the keymap variable is equivelent to using vim.keymap.set("mode n=normal v=visual i=insert","key", action)

-- NOTE: Define a keymaps variable to store our keymaps as a function
local keymaps = function(client, bufnr)
	-- NOTE: rename references throughout an entire file?
	keymap("n", "<leader>rn", vim.lsp.buf.rename, { buffer = bufnr, desc = "[R]e[n]ame" })

	-- NOTE: Keymap to get code actions
	keymap("n", "<leader>ca", vim.lsp.buf.code_action, { buffer = bufnr, desc = "[C]ode [A]ction" })

	-- NOTE: Keymap to go to definition
	keymap("n", "<leader>gd", vim.lsp.buf.definition, { buffer = bufnr, desc = "[G]oto [D]efinition" })

	-- NOTE: Keymap to go to Declaration
	keymap("n", "<leader>gD", vim.lsp.buf.declaration, { buffer = bufnr, desc = "[G]oto [D]eclaration" })

	-- NOTE: Keymap to go to references
	keymap(
		"n",
		"<leader>gr",
		require("telescope.builtin").lsp_references,
		{ buffer = bufnr, desc = "[G]oto [R]eferences" }
	)

	-- NOTE: keymap to go to implementation
	keymap("n", "<leader>gI", vim.lsp.buf.implementation, { buffer = bufnr, desc = "[G]oto [I]mplementation" })

	-- NOTE: find Type definition
	keymap("n", "<leader>D", vim.lsp.buf.type_definition, { buffer = bufnr, desc = "Type [D]efinition" })

	-- NOTE: show lsp document symbols in telescope UI
	keymap(
		"n",
		"<leader>ds",
		require("telescope.builtin").lsp_document_symbols,
		{ buffer = bufnr, desc = "[D]ocument [S]ymbols" }
	)

	-- NOTE: show lsp dynamic symbols in telescope UI
	keymap(
		"n",
		"<leader>ws",
		require("telescope.builtin").lsp_dynamic_workspace_symbols,
		{ buffer = bufnr, desc = "[W]orkspace [S]ymbols" }
	)

	-- NOTE: add a workspace folder
	keymap(
		"n",
		"<leader>waf",
		vim.lsp.buf.add_workspace_folder,
		{ buffer = bufnr, desc = "[W]orkspace [A]dd [F]older" }
	)

	-- NOTE: Remove a workspace folder
	keymap(
		"n",
		"<leader>wrf",
		vim.lsp.buf.remove_workspace_folder,
		{ buffer = bufnr, desc = "[W]orkspace [R]emove [F]older" }
	)

	-- NOTE: List workspace folders
	keymap("n", "<leader>wlf", function()
		print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
	end, { buffer = bufnr, desc = "[W]orkspace [L]ist [F]olders" })

	-- See `:help K` for why this keymap
	-- NOTE: show documentation for what is currently under the cursor
	keymap("n", "K", vim.lsp.buf.hover, { buffer = bufnr, desc = "Hover Documentation" })

	-- NOTE: show signature help for what is currently under the cursor
	keymap("n", "<leader>k", vim.lsp.buf.signature_help, { buffer = bufnr, desc = "Signature Documentation" })
end

-- NOTE: return the keymaps variabl function when this file is called
return keymaps
