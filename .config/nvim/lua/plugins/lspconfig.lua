return {
	"neovim/nvim-lspconfig",
	cmd = { "LspInfo", "LspLog", "LspInstall", "LspStart" },
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
	},
	config = function()
		local lspconfig = require("lspconfig")
		local cmp_nvim_lsp = require("cmp_nvim_lsp")
		local util = require("lspconfig.util")

		local unpack = table.unpack

		local on_attach = require("lsp.on_attach").on_attach

		local capabilities = cmp_nvim_lsp.default_capabilities()

		lspconfig.clangd.setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})

		lspconfig.cmake.setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})

		lspconfig.lua_ls.setup({
			capabilities = capabilities,
			on_attach = on_attach,
			settings = { -- custom settings for lua
				Lua = {
					-- make the language server recognize "vim" global
					diagnostics = {
						globals = { "vim" },
					},
					workspace = {
						-- make language server aware of runtime files
						library = {
							[vim.fn.expand("$VIMRUNTIME/lua")] = true,
							[vim.fn.stdpath("config") .. "/lua"] = true,
						},
					},
				},
			},
		})

		lspconfig.pyright.setup({
			capabilities = capabilities,
			on_attach = on_attach,
			root_dir = function(fname)
				local root_files = {
					"pyproject.toml",
					"setup.py",
					"setup.cfg",
					"requirements.txt",
					"Pipfile",
					"pyrightconfig.json",
					".git",
					".env",
				}
				return util.root_pattern(unpack(root_files))(fname) or vim.fn.getcwd()
			end,
		})

		if vim.loop.os_uname().sysname == "Darwin" then
			lspconfig.omnisharp.setup({
				cmd = { "dotnet", vim.fn.expand("~/.local/share/nvim/mason/packages/omnisharp/libexec/OmniSharp.dll") },
			})
		end
	end,
}
