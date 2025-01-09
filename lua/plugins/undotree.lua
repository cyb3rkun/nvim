return {
	"mbbill/undotree",
	config = function()
		vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)
		-- vim.keymap.set("n", "<leader>u", function ()
		-- 	if vim.fn.exists(":Neotree") == 2 then
		-- 		vim.cmd("Neotree close")
		-- 	end
		-- 	vim.cmd("UndotreeToggle")
		-- end, {desc = "Toggle UndoTree and ensure neotree is closed"})
	end,
}
