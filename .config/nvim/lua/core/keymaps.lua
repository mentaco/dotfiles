-- buffer control
vim.keymap.set('n', '<C-J>', '<Cmd>bprevious<CR>')
vim.keymap.set('n', '<C-K>', '<Cmd>bnext<CR>')

-- tabpage control
vim.keymap.set('n', 'st', '<Cmd>tabnew<CR>')
vim.keymap.set('n', 'sn', '<Cmd>tabnext<CR>')
vim.keymap.set('n', 'sp', '<Cmd>tabprevious<CR>')
vim.keymap.set('n', 'sc', '<Cmd>tabclose<CR>')

-- window control
vim.keymap.set('n', '<S-J>', '<Cmd>resize -2<CR>')
vim.keymap.set('n', '<S-K>', '<Cmd>resize +2<CR>')
vim.keymap.set('n', '<S-H>', '<Cmd>vertical resize -2<CR>')
vim.keymap.set('n', '<S-L>', '<Cmd>vertica resize +2<CR>')

-- cursor
vim.keymap.set('n', '<C-H>', '<S-H>')
vim.keymap.set('n', '<C-L>', '<S-L>')

-- concatenation of rows
vim.keymap.set('n', '<S-U>', '<S-J>')

-- telescope file browser
vim.keymap.set( 'n', '<leader>ts', ':Telescope file_browser<CR>')

-- NvimTree
vim.keymap.set('n', '<C-N>', ':NvimTreeToggle<CR>')
