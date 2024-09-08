return {
	"jay-babu/mason-null-ls.nvim",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"williamboman/mason.nvim",
		"nvimtools/none-ls.nvim",
		"gbprod/none-ls-shellcheck.nvim",
	},
	config = function()
		local mason_null_ls = require("mason-null-ls")
		local null_ls = require("null-ls")

		mason_null_ls.setup({
			ensure_installed = { "stylua", "black", "isort", "clang-format", "shfmt", "shellcheck" },
			automatic_installation = true,
			handlers = {},
		})

		local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
		null_ls.setup({
			-- debug = true,
			sources = {
				require("none-ls-shellcheck.diagnostics"),
				require("none-ls-shellcheck.code_actions"),
			},
			on_attach = function(client, bufnr)
				-- formatting on save
				if client.supports_method("textDocument/formatting") then
					vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
					vim.api.nvim_create_autocmd("BufWritePre", {
						group = augroup,
						buffer = bufnr,
						callback = function()
							vim.lsp.buf.format({ async = false })
						end,
					})
				end
			end,
		})
	end,

	-- Format code
	vim.keymap.set("n", "<leader>p", function()
		vim.lsp.buf.format({ async = false })
	end),
}
