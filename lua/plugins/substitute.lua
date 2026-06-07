return {
	-- Trying out mini.operators in place of substitute.nvim since it
	-- supports blockwise swapping.
	-- {
	-- 	"gbprod/substitute.nvim",
	-- 	event = { "BufReadPre", "BufNewFile" },
	--
	-- 	config = function()
	-- 		local substitute = require "substitute"
	-- 		local exchange = require "substitute.exchange"
	--
	-- 		substitute.setup {
	-- 			on_substitute = nil,
	-- 			yank_substituted_text = false,
	-- 			preserve_cursor_position = false,
	-- 			modifiers = nil,
	-- 			highlight_substituted_text = {
	-- 				enabled = true,
	-- 				timer = 500,
	-- 			},
	-- 			range = {
	-- 				prefix = "s",
	-- 				prompt_current_text = false,
	-- 				confirm = false,
	-- 				complete_word = false,
	-- 				subject = nil,
	-- 				range = nil,
	-- 				suffix = "",
	-- 				auto_apply = false,
	-- 				cursor_position = "end",
	-- 			},
	-- 			exchange = {
	-- 				motion = false,
	-- 				use_esc_to_cancel = true,
	-- 				preserve_cursor_position = false,
	-- 			},
	-- 		}
	--
	-- 		local keymap = vim.keymap.set
	--
	-- 		keymap(
	-- 			"n",
	-- 			"<Insert>",
	-- 			substitute.operator,
	-- 			{ desc = "Substitute with motion" }
	-- 		)
	-- 		keymap(
	-- 			"n",
	-- 			"<Insert><Insert>",
	-- 			substitute.line,
	-- 			{ desc = "Substitute line" }
	-- 		)
	-- 		keymap(
	-- 			"n",
	-- 			"<F3>",
	-- 			substitute.eol,
	-- 			{ desc = "Substitute to end of line" }
	-- 		)
	-- 		keymap(
	-- 			"x",
	-- 			"<F7>",
	-- 			substitute.line,
	-- 			{ desc = "Substitute in visual mode" }
	-- 		)
	--
	-- 		keymap("n", "sx", exchange.operator, {
	-- 			noremap = true,
	-- 			desc = "swap with motion",
	-- 		})
	-- 		keymap("n", "sxx", exchange.line, {
	-- 			noremap = true,
	-- 			desc = "swap linewise",
	-- 		})
	-- 		keymap("x", "X", function()
	-- 			if vim.fn.visualmode() == "\22" then
	-- 			else
	-- 				exchange.visual()
	-- 			end
	-- 		end, {
	-- 			noremap = true,
	-- 			desc = "swap visual selection",
	-- 		})
	-- 		keymap("n", "sxc", exchange.cancel, {
	-- 			noremap = true,
	-- 			desc = "cancel swap",
	-- 		})
	-- 	end,
	-- },

	{
		"nvim-mini/mini.operators",
		version = false,

		config = function()
			local opts = {
				-- Each entry configures one operator.
				-- `prefix` defines keys mapped during `setup()`: in Normal mode
				-- to operate on textobject and line, in Visual - on selection.

				-- Evaluate text and replace with output
				evaluate = {
					prefix = "g=",

					-- Function which does the evaluation
					func = nil,
				},

				-- Exchange text regions
				exchange = {
					-- NOTE: Default `gx` is remapped to `gX`
					prefix = "gx",

					-- Whether to reindent new text to match previous indent
					reindent_linewise = true,
				},

				-- Multiply (duplicate) text
				multiply = {
					prefix = "gm",

					-- Function which can modify text before multiplying
					func = nil,
				},

				-- Replace text with register
				replace = {
					-- NOTE: Default `gr*` LSP mappings are removed
					prefix = "gr",

					-- Whether to reindent new text to match previous indent
					reindent_linewise = true,
				},

				-- Sort text
				sort = {
					prefix = "gs",

					-- Function which does the sort
					func = nil,
				},
			}
			require("mini.operators").setup(opts)
		end,
	},
}
