---@diagnostic disable-next-line: undefined-global
local capabilities = require("blink.cmp").get_lsp_capabilities()

vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(ev)
		local bufnr = ev.buf
		local client = vim.lsp.get_client_by_id(ev.data.client_id)

		-- apply lsp_mappings
		local keymaps = require("config.lsp_mappings")
		keymaps(client, bufnr)

		-- format with lsp
		vim.api.nvim_buf_create_user_command(
			bufnr,
			"Format",
			function() vim.lsp.buf.format() end,
			{ desc = "LSP: Format current buffer with" }
		)
	end,
})

vim.lsp.inlay_hint.enable(true)

vim.lsp.config("*", { capabilities = capabilities })

local default_servers = {
	-- "lua_ls",
	"jdtls",
	-- "gdscript",
	-- "csharp_ls",
	"bashls",
	"marksman",
	"html",
	"cssls",
	"eslint",
	"ruff",
	"omnisharp",
	"gopls",
	"fish_lsp",
	"qmlls",
	-- "rnix",
	"nil_ls",
	-- "bacon-ls"
	-- "buf",
	-- "black"
	-- "pylsp",
	-- "biome", -- For JS, TS and other web languages
	-- "neorg-interim-ls",
}

for _, s in ipairs(default_servers) do
	vim.lsp.enable({ s })
end

vim.lsp.enable({ "gdscript" })
vim.lsp.enable({ "clangd" })
vim.lsp.enable({ "lua_ls" })
vim.lsp.enable({ "biome" })
vim.lsp.enable({ "pylsp" })
vim.lsp.enable({ "ast_grep" })

print("LSP Module loaded!")
