return {
	"akinsho/flutter-tools.nvim",
	lazy = false,
	dependencies = {
		"nvim-lua/plenary.nvim",
		"stevearc/dressing.nvim",
	},
	config = function()
		local flutter_tools = require("flutter-tools")
		local cmp_nvim_lsp = require("cmp_nvim_lsp")

        local on_attach = require("lsp.on_attach").on_attach
		-- local capabilities = cmp_nvim_lsp.default_capabilities()
        local capabilities = require("lsp.capabilities").capabilities

		flutter_tools.setup({
			dev_log = {
				open_cmd = "botright 10new",
			},
			lsp = {
				on_attach = on_attach,
				capabilities = capabilities,
			},
		})
	end,
}
