-- buffer control
vim.keymap.set('n', '<C-J>', '<Cmd>bprevious<CR>', { noremap = true })
vim.keymap.set('n', '<C-K>', '<Cmd>bnext<CR>', { noremap = true })

-- tabpage control
vim.keymap.set('n', 'st', '<Cmd>tabnew<CR>', { noremap = true })
vim.keymap.set('n', 'sn', '<Cmd>tabnext<CR>', { noremap = true })
vim.keymap.set('n', 'sp', '<Cmd>tabprevious<CR>', { noremap = true })
vim.keymap.set('n', 'sc', '<Cmd>tabclose<CR>', { noremap = true })

-- window control
vim.keymap.set('n', '<S-J>', '<Cmd>resize -2<CR>', { noremap = true })
vim.keymap.set('n', '<S-K>', '<Cmd>resize +2<CR>', { noremap = true })
vim.keymap.set('n', '<S-H>', '<Cmd>vertical resize -2<CR>', { noremap = true })
vim.keymap.set('n', '<S-L>', '<Cmd>vertica resize +2<CR>', { noremap = true })

-- cursor
vim.keymap.set('n', '<C-H>', '<S-H>', { noremap = true })
vim.keymap.set('n', '<C-L>', '<S-L>', { noremap = true })

-- concatenation of rows
vim.keymap.set('n', '<S-U>', '<S-J>', { noremap = true })

-- telescope file browser
vim.api.nvim_set_keymap( "n", "<leader>ts", ":Telescope file_browser<CR>", { noremap = true })

-- NvimTree
vim.api.nvim_set_keymap( "n", "<C-N>", ":NvimTreeToggle<CR>", { noremap = true })
