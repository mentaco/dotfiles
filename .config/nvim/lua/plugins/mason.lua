return {
	"williamboman/mason.nvim",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
	},
	cmd = { "Mason", "MasonInstall" },
	config = function()
		local mason = require("mason")
		local mason_lspconfig = require("mason-lspconfig")

		mason.setup({
			ui = {
				border = "single",
			},
		})

		mason_lspconfig.setup({
			ensure_installed = { "clangd", "lua_ls", "pyright" },
			automatic_installation = true,
		})
	end,
}
