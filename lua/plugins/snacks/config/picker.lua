return {
	enabled = true,
	ui_select = true,
	layouts = {
		wide = {
			layout = {
				box = "horizontal",
				width = 0.9,
				height = 0.9,
				{
					box = "vertical",
					border = true,
					title = "{title} {live} {flags}",
					{ win = "input", height = 1, border = "bottom" },
					{ win = "list", border = "none" },
				},
				{
					win = "preview",
					title = "{preview}",
					border = true,
					width = 0.5,
				},
			},
		},
		narrow = {
			reverse = true,
			layout = {
				box = "vertical",
				width = 0.9,
				height = 0.8,
				border = true,
				title = "{title} {live} {flags}",
				title_pos = "center",
				{ win = "list", border = "none" },
				{ win = "input", height = 1, border = "top" },
				{
					win = "preview",
					title = "{preview}",
					height = 0.5,
					border = "top",
				},
			},
		},
	},
	layout = {
		preset = function()
			return vim.o.columns >= 150 and "wide" or "narrow"
		end,
	},
	actions = {
		copy_notifications = function(picker)
			local selected = picker:selected({ fallback = true })
			local lines = {}
			for _, item in ipairs(selected) do
				table.insert(lines, item.text)
			end
			local result = table.concat(lines, "\n")
			vim.fn.setreg("+", result)
			vim.fn.setreg('"', result)
			vim.notify(
				"Copied " .. #selected .. " notification(s)",
				vim.log.levels.INFO
			)
		end,
	},

	sources = {
		notifier = {
			win = {
				list = {
					keys = {
						["<C-y>"] = "copy_notifications",
					},
				},
			},
		},

		grep = {
			hidden = true,
		},
		files = {
			hidden = true,
		},
		explorer = {
			hidden = true,
			win = {
				list = {
					keys = {
						["c"] = "copy_path",
					},
				},
			},
			layout = {
				preset = "sidebar",
			},
			actions = {
				copy_path = function(_, item)
					local modify = vim.fn.fnamemodify
					local filepath = item.file
						or "Couldn't coppy filepath"
					local filename = modify(filepath, ":t")
					local results = {
						filepath,
						modify(filepath, ":."),
						modify(filepath, ":~"),
						filename,
						modify(filename, ":r"),
						modify(filename, ":e"),
					}
					local items = {
						"Absolute path: " .. results[1],
						"Relative path (CWD): " .. results[2],
						"Path relative to HOME: " .. results[3],
						"Filename: " .. results[4],
					}
					if vim.fn.isdirectory(filepath) == 0 then
						vim.list_extend(items, {
							"Basename: " .. results[5],
							"Extension: " .. results[6],
						})
					end
					vim.ui.select(items, {
						prompt = "Select Copy Operation",
					}, function(choice, i)
						if not choice or not i then return end
						local result = results[i]
						vim.fn.setreg('"', result)
						vim.fn.setreg("0", result)
						vim.notify(
							"Copied: " .. result,
							vim.log.levels.INFO
						)
					end)
				end,
			},
		},
	},
}
