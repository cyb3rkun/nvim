return {
	'folke/todo-comments.nvim',
	event = 'VimEnter',
	dependencies = {
		'nvim-lua/plenary.nvim'
	},
	opts = {
		signs = true,
		keywords = {
			TODO = { icon =" ", color = "info"},
		},
	}
}

