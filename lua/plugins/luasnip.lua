return {
	"L3MON4d3/LuaSnip",
	opts = function(_, opts)
		local ls = require("luasnip")
		local snippet = ls.snippet
		local text = ls.text_node
		local insert = ls.insert_node
		local choice = ls.choice_node
		local func = ls.function_node
		local dynamic = ls.dynamic_node
		local snippet_n = ls.snippet_node
		local extras = require("luasnip.extras")
		local rep = extras.rep
		local fmt = require("luasnip.extras.fmt").fmt

		vim.keymap.set({ "i", "s" }, "<A-k>", function()
			-- if ls.expand_or_jumpable() then
			-- 	ls.expand_or_jump()
			-- end
			if ls.jumpable(1) then
				ls.jump(1)
			end
		end, { silent = true, desc = "Jump to the next insert node" })

		vim.keymap.set({ "i", "s" }, "<A-j>", function()
			if ls.jumpable(-1) then
				ls.jump(-1)
			end
		end, { silent = true, desc = "Jump to the prev insert node" })

		vim.keymap.set({ "i", "s" }, "<A-n>", function()
			if ls.choice_active() then
				ls.change_choice(1)
			end
		end)

		-- NOTE: This is an example snippet
		ls.add_snippets("lua", {
			snippet("hello", {
				text('print("hello '), -- Write "print("hello
				insert(1), -- Insert the cursor after hello
				text('world")'), -- then write "world)"
			}),
			snippet("ret", {
				text({ "return {", "\t" }),
				insert(1),
				text({ "", "}" }),
			}),
			snippet("if", {
				text("if "),
				insert(1, "true"),
				text(" then "),
				insert(2),
				text(" end"),
			}),
			snippet(
				"logc",
				fmt([[Debug.LOG($"<color={}>{}</color>");]], {
					choice(1, {
						text("red"),
						text("green"),
						text("blue"),
						text("cyan"),
						text("magenta"),
					}),
					insert(2),
				})
			),
			snippet("example", {
				-- use a lua function to get
				-- the snippet string
				func(function()
					return "HELLO!"
				end),
			}),
			snippet("co", {
				func(function()
					local register_data = vim.fn.getreg() .. ""
					if string.match(register_data, "[%d-]+,%s*[%d-]+") then
						return register_data
					else
						print("register does not contain Pattern")
					end
				end),
				text("])"),
			}),
		})
		ls.add_snippets("gdscript", {
			snippet("func", {
				-- text('func method() -> '),
				text("func "),
				insert(1, "function_name"),
				text("("),
				insert(2, "arg: int"),
				text(")"),
				text(" -> "),
				insert(3, "void"),
				text({ ":", "\t" }),
				insert(4),
				text({"", "\t"}),
				insert(5, "return"),
			}),
			snippet("var", {
				text("var "),
				insert(1, "name"),
				text(": "),
				insert(2, "void"),
				text(" = "),
				insert(3, "value"),
			}),
			snippet("var", {
				text("var "),
				insert(1, "name"),
				text(": "),
				insert(2, "void"),
			}),
			snippet("@expo", {
				text("@export var "),
				insert(1, "name"),
				text(": "),
				insert(2, "void "),
				text("= "),
				insert(3, "value"),
			}),
			snippet("@expo", {
				text("@export var "),
				insert(1, "name"),
				text(": "),
				insert(2, "void "),
			}),
		})
	end,
}
