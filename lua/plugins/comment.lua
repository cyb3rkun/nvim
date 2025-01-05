-- YT: @joseanmartinez
-- YT_VID: https://www.youtube.com/watch?v=6pAG3BHurdM

-- DESCRIPTION: this plugin allows for easy comment editing
-- NOTE: I'm comfortable with the default keymaps you can find on the github page
return {
	"numToStr/Comment.nvim",
	-- NOTE: this plugin gets loaded when opening or creating a new file
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local comment = require("Comment")
		comment.setup()
		-- NOTE: if you want to customize the configuration
		-- define it after setup to get a list of options that can
		-- be modified you can run :h comment.config
	end,
}
