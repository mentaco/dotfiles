return {
	"nvim-treesitter/nvim-treesitter",
	branch = "main",
	lazy = false,
	build = ":TSUpdate",
	config = function()
		local config = require("nvim-treesitter")

		local languages = {
			"bash",
			"c",
			"cpp",
			"dart",
			"lua",
			"vim",
			"python",
		}

		config.install(languages)

		vim.api.nvim_create_autocmd("FileType", {
			callback = function(args)
                -- VimTeXはVim syntaxに依存する機能があるため除外
				if vim.bo[args.buf].filetype == "tex" then
					return
				end

				pcall(vim.treesitter.start, args.buf)
			end,
		})
	end,
}
