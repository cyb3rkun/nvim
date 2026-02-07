return {
	"folke/trouble.nvim",
	opts = {},
	cmd = "Trouble",
	keys = {
		{
			"<leader>xx",
			"<cmd>Trouble diagnostics toggle focus=true<CR>",
			desc = "Open/Close Trouble",
		},
		{
			"<leader>xt",
			"<cmd>Trouble <CR>",
			desc = "",
		},
		{
			"<leader>xl",
			"<cmd>Trouble loclist toggle<CR>",
			desc = "Location List (Trouble)",
		},
		{
			"<leader>xq",
			"<cmd>Trouble quickfix toggle<CR>",
			desc = "QuickFixList (Trouble)",
		},
		{
			"<leader>xs",
			"<cmd>Trouble symbols toggle focus=false<CR>",
			desc = "Symbols (Trouble)",
		},
		{
			"<leader>sd",
			"<cmd>Trouble lsp_declarations toggle<CR>",
			desc = "LSP Definitions / References (Trouble)",
		},
		{
			"<leader>sD",
			"<cmd>Trouble lsp_definitions toggle<CR>",
			desc = "LSP Decinitions",
		},
		{
			"<leader>ss",
			"<cmd>Trouble lsp_document_symbols toggle<CR>",
			desc = "LSP Document symbols",
		},
		{
			"<leader>si",
			"<cmd>Trouble lsp_implementations toggle<CR>",
			desc = "LSP Implementations",
		},
		{
			"<leader>sc",
			"<cmd>Trouble lsp_incoming_calls toggle<CR>",
			desc = "LSP Implementations",
		},
		{
			"<leader>sr",
			"<cmd>Trouble lsp_references toggle<CR>",
			desc = "LSP References",
		},
		{
			"<leader>sc",
			"<cmd>Trouble lsp_type_definitions toggle<CR>",
			desc = "LSP Type Definitions",
		},
		{
			"<leader>c",
			"<cmd>Trouble todo toggle<CR>",
			desc = "Todo Comments (trouble)",
		},
	},
}
