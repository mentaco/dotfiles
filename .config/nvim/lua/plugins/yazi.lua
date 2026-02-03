return {
	"mikavilpas/yazi.nvim",
	version = "*",
	event = "VeryLazy",
	dependencies = {
		{ "nvim-lua/plenary.nvim", lazy = true },
	},
	keys = {
		-- Keymaps
		{
			"<leader>y",
			mode = { "n", "v" },
			"<cmd>Yazi<cr>",
			desc = "Open yazi at the current file",
		},
		{
			"<leader>cw",
			"<cmd>Yazi cwd<cr>",
			desc = "Open the file manager in nvim's working directory",
		},
		{
			"<C-y>",
			"<cmd>Yazi toggle<cr>",
			desc = "Resume the last yazi session",
		},
	},
	opts = {
		-- Open yazi instead of netrw
		open_for_directories = true,
		keymaps = {
			show_help = "<f1>",
		},

		-- Disable TermClose autocmd when yazi is opened
		hooks = {
			yazi_opened = function(_preselected_path, _yazi_buffer_id, _config)
				local ei = vim.o.eventignore
				if not ei:match("(^|,)TermClose(,|$)") then
					vim.o.eventignore = (ei == "") and "TermClose" or (ei .. ",TermClose")
				end
			end,

			-- Restore after closing yazi
			yazi_closed_successfully = function(_chosen_file, _config, _state)
				local ei = vim.o.eventignore
				ei = ei:gsub("(^|,)TermClose(,|$)", "%1")
				ei = ei:gsub(",,+", ",")
				ei = ei:gsub("^,", ""):gsub(",$", "")
				vim.o.eventignore = ei
			end,
		},
	},
	init = function()
		-- mark netrw as loaded so it's not loaded at all.
		vim.g.loaded_netrwPlugin = 1
	end,
}
