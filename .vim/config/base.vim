set encoding=utf-8
scriptencoding utf-8

set nobackup

set number

set virtualedit=onemore	" 行末まで移動可能


set showmatch
set matchtime=1

set pumheight=10	" 補完メニューの高さ

set hlsearch		" 検索文字をハイライト
set incsearch		" 検索ワードの最初の文字を入力した時点で検索を開始

" タブ・インデントの設定
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set autoindent
set smartindent

filetype plugin indent on
autocmd BufWritePost ~/.vimrc source ~/.vimrc
autocmd FileType c setlocal cindent
autocmd FileType cpp setlocal cindent

set wildmenu

set mouse=a

set hidden		"バッファ切り替えの時にファイルを保存しなくてもよい"

"括弧・クォーテーションの補完"
inoremap { {}<LEFT>
" inoremap [ []<LEFT>
" inoremap ( ()<LEFT>
" inoremap " <LEFT>
" inoremap ' ''<LEFT>

" 括弧の自動改行
" function! AddIndentWhenEnter()
"     if getline(".")[col(".")-1] == "}" && getline(".")[col(".")-2] == "{"
"         return "\n\t\n\<UP>\<END>"
"     else
"         return "\n"
"     endif
" endfunction
" inoremap <silent> <expr> <CR> AddIndentWhenEnter()


