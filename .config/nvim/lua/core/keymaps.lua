-- buffer control
vim.keymap.set('n', '<C-J>', ':bprevious<CR>')
vim.keymap.set('n', '<C-K>', ':bnext<CR>')

-- tabpage control
vim.keymap.set('n', 'st', ':tabnew<CR>')
vim.keymap.set('n', 'sn', ':tabnext<CR>')
vim.keymap.set('n', 'sp', ':tabprevious<CR>')
vim.keymap.set('n', 'sc', ':tabclose<CR>')

-- window control
vim.keymap.set('n', '_', ':horizontal resize -2<CR>')
vim.keymap.set('n', '+', ':horizontal resize +2<CR>')
vim.keymap.set('n', '-', ':vertical resize -2<CR>')
vim.keymap.set('n', '=', ':vertical resize +2<CR>')

-- telescope file browser
vim.keymap.set( 'n', '<leader>ts', ':Telescope file_browser<CR>')

-- format code
vim.keymap.set("n", "<leader>p", function()
	vim.lsp.buf.format({ async = false })
end)

-- jq format
vim.keymap.set('n', '<F5>', ':%!jq .<CR>')

-- no-neck-pain toggle
vim.keymap.set("n", "<leader>z", "<cmd>NoNeckPain<CR>")
