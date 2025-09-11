local keymap = vim.keymap.set
-- NOTE: using the keymap variable is equivelent to using vim.keymap.set("mode n=normal v=visual i=insert","key", action)

-- NOTE: Define a keymaps variable to store our keymaps as a function
---@diagnostic disable-next-line: unused-local
local keymaps = function(client, bufnr)
	keymap("n", "<leader>rn", vim.lsp.buf.rename, {
		buffer = bufnr,
		desc = "[R]e[n]ame",
	})

	keymap("n", "<leader>ca", vim.lsp.buf.code_action, {
		buffer = bufnr,
		desc = "[C]ode [A]ction",
	})

	keymap("n", "<leader>gd", vim.lsp.buf.document_symbol, {
		buffer = bufnr,
		desc = "[G]oto [D]efinition",
	})

	keymap("n", "<leader>gD", vim.lsp.buf.declaration, {
		buffer = bufnr,
		desc = "[G]oto [D]eclaration",
	})

	-- DEP: replace with snacks
	-- keymap(
	-- 	"n",
	-- 	"<leader>gr",
	-- 	require("telescope.builtin").lsp_references,
	-- 	{ buffer = bufnr, desc = "[G]oto [R]eferences" }
	-- )

	-- NOTE: keymap to go to implementation
	keymap("n", "<leader>gI", vim.lsp.buf.implementation, {
		buffer = bufnr,
		desc = "[G]oto [I]mplementation",
	})

	-- NOTE: find Type definition
	keymap("n", "<leader>D", vim.lsp.buf.type_definition, {
		buffer = bufnr,
		desc = "Type [D]efinition",
	})

	-- DEP: These keymaps have been replaced by snacks picker
	-- NOTE: show lsp document symbols in telescope UI
	-- keymap(
	-- 	"n",
	-- 	"<leader>ds",
	-- 	require("telescope.builtin").lsp_document_symbols,
	-- 	{ buffer = bufnr, desc = "[D]ocument [S]ymbols" }
	-- )

	-- NOTE: show lsp dynamic symbols in telescope UI
	-- keymap(
	-- 	"n",
	-- 	"<leader>ws",
	-- 	require("telescope.builtin").lsp_dynamic_workspace_symbols,
	-- 	{ buffer = bufnr, desc = "[W]orkspace [S]ymbols" }
	-- )

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
	end, {
		buffer = bufnr,
		desc = "[W]orkspace [L]ist [F]olders",
	})

	-- See `:help K` for why this keymap
	-- NOTE: show documentation for what is currently under the cursor
	keymap("n", "K", function()
		vim.lsp.buf.hover({
			border = "rounded",
		})
	end, {
		buffer = bufnr,
		desc = "Hover Documentation",
	})
	-- NOTE: show signature help for what is currently under the cursor
	keymap("n", "<leader>k", vim.lsp.buf.signature_help, {
		buffer = bufnr,
		desc = "Signature Documentation",
	})

	keymap("n", "]d", function()
		vim.diagnostic.jump({ count = 1, float = true })
	end, {
		desc = "Go to previous [D]iagnostic message",
	})
	-- NOTE: toggle virtual lines for diagnostics
	keymap("n", "<leader>sl", function()
		local current = vim.diagnostic.config().virtual_lines
		vim.diagnostic.config({
			virtual_lines = not current,
		})
	end, { desc = "toggle virtual lines for Diagnostics" })

	keymap("n", "[d", function()
		vim.diagnostic.jump({ count = -1, float = true })
	end, {
		desc = "Go to next [D]iagnostic message",
	})

	keymap("n", "<leader>t", vim.diagnostic.open_float, {
		desc = "Show diagnostic [E]rror messages",
	})

	keymap("n", "<leader>q", vim.diagnostic.setloclist, {
		desc = "Open diagnostic [Q]uickfix list",
	})
end

-- NOTE: return the keymaps variabl function when this file is called
return keymaps

