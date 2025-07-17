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
			ensure_installed = { "bashls", "clangd", "lua_ls", "pyright" },
			automatic_installation = true,
		})

        -- Keymap for jq
        vim.keymap.set('n', '<F5>', ':%!jq .<CR>')
	end,
}
