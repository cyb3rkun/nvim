-- KUDOS:
-- YT_CHANNEL: @joseanmartinez
-- GITHUB: @Geerayef/Dotfiles
-- https://github.com/Geerayef/Dotfiles/blob/6dd72f17130a8d5f76b5a919594990c8497cc4b9/.config/nvim/lua/plugins/lsp.lua
return {
	-- NOTE: this is where we define which plugin we want to use
	"neovim/nvim-lspconfig", -- In this case that's nvim-lspconfig
	event = { "BufReadPre", "BufNewFile" }, -- NOTE: this is where we define on which event a plugin should load

	-- NOTE: We define Dependencies in the dependencies field. these are plugins that are required
	-- by nvim-lspconfig to function.
	--
	-- NOTE:  not all of the below plugins are strictly required for nvim-lsp to function but are instead
	-- some extras to make things more convenient
	dependencies = {
		-- "hrsh7th/nvim-cmp", -- WARN: this one is required for nvim-lsp to work
		"hrsh7th/cmp-nvim-lsp", -- WARN: this one is required for nvim-lsp to work
		-- "hrsh7th/cmp-buffer", -- WARN: I'm uncertain if this one is strictly required for nvim-lsp but I believe it is
		-- "hrsh7th/cmp-path", -- WARN: This plugin is not strictly required for nvim-lsp but it allows for filepaths in autocompletion

		-- NOTE: this will ensure that mason is loaded before lsp is set up.
		-- we use mason to manage lsps, linters, formatters and Debug adapters
		"williamboman/mason.nvim",

		-- WARN: MASON MUST BE LOADED BEFORE mason-lspconfig can be properly setup
		"williamboman/mason-lspconfig.nvim",

		-- NOTE: this plugin is useful for when tinkering with neovim configs
		{ "folke/neodev.nvim", opts = {} },
	},

	config = function()
		-- NOTE: import lspconfig and assign it to lsp variable
		local lsp = require("lspconfig")

		-- WARN: still implementing this
		local mason_lspconfig = require("mason-lspconfig")

		--NOTE:  import cmp-nvim-lsp
		local cmp_nvim_lsp = require("cmp_nvim_lsp")

		-- NOTE: Set default capabilities for lsp servers
		local capabilities = vim.tbl_deep_extend(
			"force",
			{},
			vim.lsp.protocol.make_client_capabilities(),
			cmp_nvim_lsp.default_capabilities()
		)

		-- WARN: Not sure why this is here, it should probably be removed
		local opts = { noremap = true, silent = true }

		-- NOTE: when an lsp attaches to the buffer this will be passed to the lsp_attach field to run immediately after
		local lsp_attach = function(client, bufnr)
			--set the options.buffer to the currently open buffer?
			opts.buffer = bufnr

			-- NOTE: Import the keymaps that are defined in lsp_keymaps
			local keymaps = require("Cyb3rVim.lsp.lsp_keymaps")

			-- NOTE: after importing call the function to set up the keymaps defined in lsp_keymaps.lua
			keymaps(client, bufnr)

			-- NOTE: set up lsp formatting when an lsp attaches to the buffer
			vim.api.nvim_buf_create_user_command(bufnr, "Format", function()
				vim.lsp.buf.format()
			end, { desc = "Format current buffer with lsp" })

			-- NOTE: It would be nice to have GDscript Documentation-
			-- comments show up in cmp but I can't get this to work
			-- at the moment.
			-- I could have sword that it used to work but I might
			-- have just been dreaming
		end

		-- NOTE: Change the Diagnostic symbols in the gutter
		local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
		for type, icon in pairs(signs) do
			local hl = "DiagnosticSign" .. type
			vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
		end

		-- DESCRIPTION: from here on out we set up different lsp servers with our options
		-- DESC: To set up a language server we call lspconfig.[server_name].setup({}) and we pass the options into the setup function
		-- NOTE: that here lspconfig is acquired through the lsp variable defined above

		-- NOTE: Lua Language server
		lsp.lua_ls.setup({
			capabilities = capabilities, -- NOTE: Here we pass in the capabilities of our lsp
			on_attach = lsp_attach, -- NOTE: and here we give it our keymaps from lsp_attach variable above
		})

		-- NOTE: GDscript LSP setup
		lsp.gdscript.setup({
			capabilities = capabilities,
			on_attach = lsp_attach,
		})

		lsp.bashls.setup({
			capabilities = capabilities,
			on_attach = lsp_attach,
		})

		-- NOTE: Clang Server This is For C C++ JAVA? and a bunch of others
		-- NOTE: here we setup the clangd lsp that is used for C, C++ and other languages
		-- it is basically the same as the lua language server with some extra changes
		lsp.clangd.setup({
			capabilities = capabilities, -- NOTE: once again we pass in our capabilities
			on_attach = lsp_attach, -- NOTE: once again we pass in our keymaps

			-- NOTE: with the cmd field we specify where the lsp executable is
			-- normally you wouldn't have to define this and you can just leave it out but if you'd like to use it this way make sure
			-- to change /home/cyb3rkun/ to home/username/etc
			-- NOTE: I did this to get tab indenting for c files but it should
			-- now work if you specify a .clang-format file with
			-- your desired formatting options
			-- cmd = { "/home/cyb3rkun/.local/share/nvim/mason/bin/clangd" },

			-- NOTE: here we pass in the filetypes that we want clangd to work with
			filetypes = { "c", "cpp", "objc", "objcpp", "cuda", "proto" },

			-- NOTE: clangd will look for a file with one of these names in your active directory and if it is found clangd
			-- will know that the directory in which that file is is the root of your project
			root_dir = lsp.util.root_pattern(
				".clang-format",
				".editor-config",
				".compile-commands.json",
				".compile-flags.txt",
				".configure.ac",
				".git",
				"project.godot"
			),
			single_file_support = true, -- NOTE: Enable single file support for clangd
		})
	end,
}
