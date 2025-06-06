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
run_formatter(
	{
		"/home/cyb3rkun/.local/share/nvim/mason/bin/clang-format",
		"--assume-filename=",
		"/home/cyb3rkun/Documents/esp32/c3/tft_wifi_bt_hacking/.clang-format",
	},
	"/home/cyb3rkun/Documents/esp32/c3/tft_wifi_bt_hacking/",
	read_file("/home/cyb3rkun/Documents/esp32/c3/tft_wifi_bt_hacking/main/tft_wifi_bt_hacking.c")
)
-- To test a non-stdin formatter
-- run_formatter({ "formatter_command", "arg1", "arg2" }, "/path/to/cwd")
