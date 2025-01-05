return {
	"nvim-treesitter/nvim-treesitter-textobjects",
	lazy = true,
	config = function()
		require("nvim-treesitter.configs").setup({
			textobjects = {
				select = {
					enable = true,
					-- Automatically jump to next Textobj
					lookahead = true,

					keymaps = {
						["a="] = {
							query = "@assignment.outer",
							desc = "Select Around assignment",
						},
						["i="] = {
							query = "@assignment.inner",
							desc = "Select Inside assignment",
						},
						["l="] = {
							query = "@assignment.lhs",
							desc = "Select left hand side of an assignment",
						},
						["r="] = {
							query = "@assignment.rhs",
							desc = "Select right hand side of an assignment",
						},

						["aa"] = {
							query = "@parameter.outer",
							desc = "Select Around parameter",
						},
						["ia"] = {
							query = "@parameter.inner",
							desc = "Select Inside parameter",
						},

						["ai"] = {
							query = "@conditional.outer",
							desc = "Select Around conditional",
						},
						["ii"] = {
							query = "@conditional.inner",
							desc = "Select Inside conditional",
						},

						["al"] = {
							query = "@loop.outer",
							desc = "Select Around loop",
						},
						["il"] = {
							query = "@loop.inner",
							desc = "Select Inside loop",
						},

						["af"] = {
							query = "@call.outer",
							desc = "Select Around function call",
						},
						["if"] = {
							query = "@call.inner",
							desc = "Select Inside function call",
						},

						["am"] = {
							query = "@function.outer",
							desc = "Select Around function",
						},
						["im"] = {
							query = "@function.inner",
							desc = "Select Inside function",
						},

						["ac"] = {
							query = "@class.outer",
							desc = "Select around class",
						},
						["ic"] = {
							query = "@class.inner",
							desc = "Select inside class",
						},

						["ag"] = {
							query = "@comment.outer",
							desc = "Select around comment",
						},

						["as"] = {
							query = "@statement.outer",
							desc = "Select Around Statement",
						},
					},
				},
			},
		})
	end,
}
