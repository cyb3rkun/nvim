-- TODO: refactor into submodule where each command has their own file
local spec_path = vim.fn.stdpath("config") .. "/formatters"
---@class LangSpec
---@field name string
---@field prepend_dot boolean

---@type table<string, LangSpec>
---Keys: string representing the language
---Values: [LangSpec] object describing the formatter file
local specs = {
	["rust"] = { name = "rustfmt.toml", prepend_dot = false },
	["c"] = { name = "clang-format", prepend_dot = true },
	["cpp"] = { name = "clang-format", prepend_dot = true },
	["js"] = { name = "biome.json", prepend_dot = false },
	["lua"] = { name = "stylua.toml", prepend_dot = true },
}

local function get_buf_lang()
	local clients = vim.lsp.get_clients()
	if #clients == 0 then
		return nil
	end
	local c = clients[1]

	-- Get the name of the language
	---@diagnostic disable-next-line: undefined-field
	return c.config.filetypes and c.config.filetypes[1] or c.name
end
---@param path string
---@return boolean
local function file_exists(path)
	local f = io.open(path, "rb")
	if f then
		f:close()
	end
	return f ~= nil
end

---@param src string
---@param dest string
local function copy_file(src, dest)
	if file_exists(dest) then
		vim.notify("File Already exists" .. dest, vim.log.levels.WARN)
		return
	end
	local infile = assert(io.open(src, "rb"))
	local content = infile:read("all")

	local outfile = assert(io.open(dest, "wb"))
	outfile:write(content)
	outfile:close()

	vim.notify("Created formatting file: " .. dest, vim.log.levels.info)
end

vim.api.nvim_create_user_command("FmFile", function()
	local workspace = vim.fn.getcwd()
	local lang = get_buf_lang()

	if not lang then
		vim.notify("No LSP client detected for this buffer", vim.log.levels.WARN)
		return
	end

	local spec = specs[lang]
	if not spec then
		vim.notify("No default formatting spec for language: " .. lang, vim.log.levels.WARN)
		return
	end

	--handle prepend dot
	local filename = (spec.prepend_dot and "." or "") .. spec.name
	local src_file = spec_path .. "/" .. spec.name
	local dest_file = workspace .. "/" .. filename
	copy_file(src_file, dest_file)
end, { desc = "Generate default formatting file for workspace" })
