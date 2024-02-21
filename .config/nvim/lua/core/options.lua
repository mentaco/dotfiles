vim.opt.encoding = 'utf-8'
vim.opt.backup = false
vim.opt.number = true
vim.opt.virtualedit = 'onemore'
vim.opt.wildmenu = true
vim.opt.hidden = true
vim.opt.mouse = 'a'
vim.opt.termguicolors = true

vim.opt.showmatch = true
vim.opt.matchtime = 1

-- completion menu height
vim.opt.pumheight = 10

vim.opt.hlsearch = true
vim.opt.incsearch = true

-- tab and indent settings
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.autoindent = true
vim.opt.smartindent = true

-- filetype
vim.cmd('autocmd FileType c setlocal cindent')
vim.cmd('autocmd FileType cpp setlocal cindent')
vim.cmd('autocmd FileType dart setlocal tabstop=2 shiftwidth=2 softtabstop=2')

