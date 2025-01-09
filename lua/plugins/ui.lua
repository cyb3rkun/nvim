-- NOTE: dressing is a plugin to give a prettier UI when asked for input text
return {
	{
		"stevearc/dressing.nvim",
		event = "VeryLazy",
	},
	{
		"eero-lehtinen/oklch-color-picker.nvim",
		event = "VeryLazy",
		opts = {},
		keys = {
			{
				"<localleader>v",
				"<cmd>ColorPickOklch<cr>",
				desc = "Color pick Under the cursor",
			},
		},
	},
}
