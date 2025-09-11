-- Copy these helper functions directly
local function run_formatter(cmd, cwd, buffer_text)
	local proc = vim.system(cmd, {
		cwd = cwd,
		stdin = buffer_text,
		text = true,
	})
	local ret = proc:wait()
	if ret.code == 0 then
		print("Success\n--------")
	else
		print("Failure\n--------")
	end
	print(ret.stdout)
	print(ret.stderr)
end

local function read_file(path)
	local file = assert(io.open(path, "r"))
	local content = file:read("*a")
	file:close()
	return content
end

-- Edit these lines to match the values you see in your conform log file
-- To test a stdin formatter
-- run_formatter(
-- 	{
-- 		"/home/cyb3rkun/.local/share/nvim/mason/bin/clang-format",
-- 		"--assume-filename=",
-- 		"/home/cyb3rkun/.config/nvim/formatters/clang-format",
-- 	},
-- 	"/home/cyb3rkun/Dev/cpp/playground/",
-- 	read_file("/home/cyb3rkun/Dev/cpp/playground/src/main.cpp")
-- )
-- To test a non-stdin formatter
-- run_formatter({ "formatter_command", "arg1", "arg2" }, "/path/to/cwd")

gdshader = function()
	vim.lsp.start({
		name = "gdshader-lsp",
		cmd = { "/home/cyb3rkun/.local/share/gdshader-lsp/gdshader-lsp" },
		-- root_dir = vim.fn.getcwd(),
		capabilities = vim.lsp.protocol.make_client_capabilities(),
	})
end

Formatb = function()
	require("conform").format({
		lsp_fallback = true,
		async = true,
		timeout_ms = 500,
	})
end
P = function(v)
	print(vim.inspect(v))
end

