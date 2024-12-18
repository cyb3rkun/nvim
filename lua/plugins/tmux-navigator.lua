return {
	"christoomey/vim-tmux-navigator",
	lazy = false,
	cmd = {
		"TmuxNavigateLeft",
		"TmuxNavigateDown",
		"TmuxNavigateUp",
		"TmuxNavigateRight",
		"TmuxNavigatePrevious",
	},
	keys = {
		{ "<M-h>", "<cmd>TmuxNavigateLeft<cr>" },
		{ "<M-j>", "<cmd>TmuxNavigateDown<cr>" },
		{ "<M-k>", "<cmd>TmuxNavigateUp<cr>" },
		{ "<M-l>", "<cmd>TmuxNavigateRight<cr>" },
		{ "<c-\\>", "<cmd>TmuxNavigatePrevious<cr>" },
	},
}
