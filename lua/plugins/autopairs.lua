---@diagnostic disable-next-line: unused-function

return {
	"windwp/nvim-autopairs",
	event = { "InsertEnter" },
	config = function()
		local npairs = require "nvim-autopairs"
		local rule = require "nvim-autopairs.rule"
		local ts_conds = require "nvim-autopairs.ts-conds"
		local function get_cntx(before)
			local anchors = {
				-- stylua: ignore start
				{ pattern = ":%s*$",                  ctx = "type" },
				{ pattern = "->%s*$",                 ctx = "type" },
				{ pattern = "::%s*$",                 ctx = "type" },
				{ pattern = "[,(<]%s*$",              ctx = "type" },
				{ pattern = "where%s+$",              ctx = "type" },
				{ pattern = "impl%s+$",               ctx = "type" },
				{ pattern = ":%s*[%w_]+$",            ctx = "type" },
				{ pattern = "->%s*[%w_]+$",           ctx = "type" },
				{ pattern = "::%s*[%w_]+$",           ctx = "type" },
				{ pattern = "[^=<>!]=%s*$",           ctx = "expr" },
				{ pattern = "[%+%-%*/%%%^&|!<>]%s*$", ctx = "expr" },
				{ pattern = "==%s*$",                 ctx = "expr" },
				{ pattern = "!=%s*$",                 ctx = "expr" },
				{ pattern = "<=%s*$",                 ctx = "expr" },
				{ pattern = ">=%s*$",                 ctx = "expr" },
				{ pattern = "&&%s*$",                 ctx = "expr" },
				{ pattern = "||%s*$",                 ctx = "expr" },
				{ pattern = "if%s+",                  ctx = "expr" },
				{ pattern = "if%s*%(",                ctx = "expr" },
				{ pattern = "while%s+",               ctx = "expr" },
				{ pattern = "while%s*%(",             ctx = "expr" },
				{ pattern = "for%s+",                 ctx = "expr" },
				{ pattern = "return%s+",              ctx = "expr" },
				{ pattern = "%l[%w_]*%s+$",           ctx = "expr" },
				-- stylua: ignore end
			}

			local best_pos = 0
			local best_ctx = "unknown"
			local best_end = 0

			for _, anchor in ipairs(anchors) do
				local last_pos = 0
				local last_end = 0
				local search_start = 1
				while true do
					local s, e =
						before:find(anchor.pattern, search_start)
					if not s then break end
					last_pos = s
					last_end = e
					search_start = s + 1
				end
				if last_pos > 0 and last_pos > best_pos then
					best_pos = last_pos
					best_end = last_end
					best_ctx = anchor.ctx

					print(
						"new best: ["
							.. anchor.pattern
							.. "] pos="
							.. last_pos
							.. " ctx="
							.. anchor.ctx
					)
				end
			end

			-- Check what's between the anchor and the cursor
			if best_ctx == "type" and best_pos > 0 then
				local after_anchor = before:sub(best_end + 1)
				if after_anchor:match "^%l[%w_]*%s+$" then
					best_ctx = "expr"
				end
				if after_anchor:match "^%d" then best_ctx = "expr" end
				if after_anchor:match "[%+%-%*/%%%^&|!]" then
					best_ctx = "expr"
				end
			end

			return best_ctx, best_pos
		end
		npairs.setup { check_ts = true, fast_wrap = {} }

		npairs.add_rule(rule("<", ">", {
			"-html",
			"-javascriptreact",
			"-typescriptreact",
		}):with_pair(function(opts)
			local before = opts.line:sub(1, opts.col)
			print("before: " .. before)

			if before:match "^%s*[<>]*$" then return true end
			if before:match "[<>]+$" then
				local before_angles = before:match "^(.-)[<>]+$"
				print(
					"stacking branch, before_angles: ["
						.. (before_angles or "nil")
						.. "]"
				)
				if before_angles then
					local ctx = get_cntx(before_angles)
					print("before_angles ctx: " .. ctx)
					if ctx == "expr" then return false end
					if ctx == "type" then return true end
					if before_angles:match "[A-Z][%w_]*%s*$" then
						return true
					end
					return false
				end
				return true
			end
			if before:match "^%s*#%s*include%s*<*$" then
				return true
			end

			-- trimm trailing = at the end of the line,
			-- this makes it possible to get angle bracket
			-- completion
			-- for type annotations when editing existing variable
			-- type annotations, and not just when writing new ones
			local before_trimmed = before:gsub("[=%s]+$", "")
			local ctx = get_cntx(before_trimmed)
			print("ctx: " .. ctx)
			if ctx == "type" then return true end
			if ctx == "expr" then return false end

			-- "unknown" context: fall back to the old heuristics as a safety net
			if before:match "[=][^=].*[%w_]%s*<*$" then
				return false
			end
			if before:match "[%s][%w_]*%s*$" then return false end
			if before:match "[%s%(,=!&|%+%-%*/%%%^][%l%d_]+$" then
				return false
			end

			return true
		end):with_move(function(opts) return opts.char == ">" end))

		local map = {
			["("] = ")",
			["["] = "]",
			["{"] = "}",
			["<"] = ">",
			['"'] = '"',
			["'"] = "'",
		}

		vim.keymap.set("i", "<M-g>", function()
			local row, col = unpack(vim.api.nvim_win_get_cursor(0))
			local line = vim.api.nvim_get_current_line()
			local pair_char = nil

			for i = col, 1, -1 do
				local c = line:sub(i, i)
				if map[c] then
					pair_char = map[c]
					break
				end
			end
			if not pair_char then return end
			_G._fastwrap_state = {
				row = row,
				col = col,
				pair_char = pair_char,
			}

			vim.o.operatorfunc = "v:lua._fastwrap_operator"
			return "<Esc>g@"
		end, { expr = true, desc = "fast wrap with motion" })

		_G._fastwrap_operator = function()
			local state = _G._fastwrap_state
			-- '] mark is set to the end of the motion
			local t_row = vim.api.nvim_buf_get_mark(0, "]")[1]
			local t_col = vim.api.nvim_buf_get_mark(0, "]")[2] + 1
			local t_line = vim.api.nvim_buf_get_lines(
				0,
				t_row - 1,
				t_row,
				true
			)[1]
			local fastwrap = require "nvim-autopairs.fastwrap"
			vim.api.nvim_win_set_cursor(0, { t_row, t_col })
			fastwrap.move_bracket(
				t_line,
				t_col,
				state.pair_char,
				true
			)
			vim.api.nvim_win_set_cursor(0, { state.row, state.col })
			vim.cmd "startinsert"
		end

		-- keymap for custom fastwrap with flash integration
		vim.keymap.set("i", "<M-f>", function()
			local fastwrap = require "nvim-autopairs.fastwrap"

			local row, col = unpack(vim.api.nvim_win_get_cursor(0))
			local line = vim.api.nvim_get_current_line()

			local pair_char = nil

			for i = col, 1, -1 do
				local c = line:sub(i, i)
				if map[c] then
					pair_char = map[c]
					break
				end
			end
			if not pair_char then return end

			require("flash").jump {
				search = { mode = "search", max_len = 0 },
				label = { after = { 0, 1 } },
				action = function(match)
					local t_row = match.pos[1]
					local t_col = match.pos[2] + 1

					local t_line = vim.api.nvim_buf_get_lines(
						0,
						t_row - 1,
						t_row,
						true
					)[1]

					vim.api.nvim_win_set_cursor(0, { t_row, t_col })

					fastwrap.move_bracket(
						t_line,
						t_col,
						pair_char,
						true
					)
					vim.api.nvim_win_set_cursor(0, { row, col })
				end,
			}
		end, { desc = "Fast wrap with flas" })
	end,
}
