return{
	'rebelot/kanagawa.nvim',
	config = function()
		require('kanagawa').setup({})
		vim.o.termguicolors = true
		vim.cmd('colorscheme kanagawa')
	end
}
