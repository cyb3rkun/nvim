return {
	"folke/flash.nvim",
	event = "VeryLazy",
	---@type Flash.Config
	opts = {
		modes = {
			search = { enabled = true },
		},
	},
	-- stylua: ignore
	keys = {
		{ "<leader>fs",     mode = { "n", "x", "o" }, function() require("flash").jump() end,              desc = "flash" },
		{ "<leader>fS",     mode = { "n", "x", "o" }, function() require("flash").treesitter() end,        desc = "flash treesitter" },
		{ "<leader>fr",     mode = {"o" },      function() require("flash").remote() end,            desc = "remote flash" },
		{ "<c-s>", mode = {"x", "o" },           function() require("flash").treesitter_search() end, desc = "treesitter search" },
		{ "<c-s>", mode = { "c" },           function() require("flash").toggle() end,            desc = "toggle flash search" },
	},
}
