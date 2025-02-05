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
