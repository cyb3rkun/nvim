-- DESCRIPTION: set vim options in this file
-- vim.g.mapleader = " "
-- vim.g.maplocalleader = "."

vim.opt.guicursor = "n-v-sm:block,i-c-ci-ve:ver25,r-cr-o:hor20"
vim.opt.mouse = "a" --Mouse Support

vim.opt.undofile = true
vim.opt.undodir = vim.fn.expand("~/.local/state/nvim/undo/")

vim.opt.number = true
vim.opt.relativenumber = true

-- vim.opt.showmode = true

-- NOTE: show the maximum line length that you don't want to exceed
vim.opt.colorcolumn = "72"

-- NOTE: Show the real line number %=%{v:lnum}
-- NOTE: then the relative line number
-- %=%{v:relnum? before? v:relnum after? v:lnum currentline = realnum}
-- WARN: vim.opt.relativenumber has to be set to true or
-- relative line numbers won't update"
vim.opt.statuscolumn = " %s%{v:relnum?v:relnum:v:lnum} "

-- NOTE: set tab and indentation options tab width = 6
vim.opt.tabstop = 6
vim.opt.softtabstop = 6
vim.opt.shiftwidth = 6

-- NOTE: set expand tab to true to use space indentation
vim.opt.expandtab = false

vim.opt.breakindent = true
vim.opt.smartindent = false
-- NOTE: do not wrap lines if they pass the column width
vim.opt.wrap = false

vim.opt.termguicolors = true
-- NOTE: enables the below list chars
-- vim.opt.list = true
-- vim.opt.listchars = { tab = "│ "}
-- NOTE: prevents the cursor from going closer than 30 lines to the
-- top or bottom.
-- WARN: does not work near end or beginning of file
vim.opt.scrolloff = 15

vim.opt.cursorline = true
vim.g.rust_recommended_style = 0

-- [[Set Up Diagnostics]] --
vim.diagnostic.config({
	virtual_lines = true,
	underline = true,
	float = {
		border = "rounded"
	}

})

-- NOTE: make all borders rounded
-- vim.o.winborder = "rounded"
