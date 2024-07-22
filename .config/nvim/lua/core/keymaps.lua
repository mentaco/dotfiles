-- buffer control
vim.keymap.set('n', '<C-J>', '<Cmd>bprevious<CR>')
vim.keymap.set('n', '<C-K>', '<Cmd>bnext<CR>')

-- tabpage control
vim.keymap.set('n', 'st', '<Cmd>tabnew<CR>')
vim.keymap.set('n', 'sn', '<Cmd>tabnext<CR>')
vim.keymap.set('n', 'sp', '<Cmd>tabprevious<CR>')
vim.keymap.set('n', 'sc', '<Cmd>tabclose<CR>')

-- window control
vim.keymap.set('n', '_', '<Cmd>horizontal resize -2<CR>')
vim.keymap.set('n', '+', '<Cmd>horizontal resize +2<CR>')
vim.keymap.set('n', '-', '<Cmd>vertical resize -2<CR>')
vim.keymap.set('n', '=', '<Cmd>vertical resize +2<CR>')

-- telescope file browser
vim.keymap.set( 'n', '<leader>ts', ':Telescope file_browser<CR>')

-- NvimTree
vim.keymap.set('n', '<C-N>', ':NvimTreeToggle<CR>')
