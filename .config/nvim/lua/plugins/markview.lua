return {
	"OXY2DEV/markview.nvim",
	lazy = false,

	config = function()
		require("markview").setup({
			preview = {
				enable = false,
				splitview_winopts = { split = "right" },
			},
		})
		vim.api.nvim_set_keymap(
			"n",
			"<leader>m",
			"<CMD>Markview splitToggle<CR>",
			{ desc = "Toggles `splitview` for current buffer." }
		)
	end,
}
