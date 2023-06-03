syntax on

set background=dark
let g:hybrid_custom_term_colors = 1
let g:hybrid_reduced_contrast = 1 " Remove this line if using the default palette.
colorschem hybrid

" Vim の色設定をリセット
" hi Normal ctermbg=none
" hi NonText ctermbg=none
" hi LinrNr ctermbg=none
" hi Folded ctermbg=none
" hi EndOfBuffer ctermbg=none

" カーソルの色
set cursorline
hi clear CursorLine
hi CursorLineNr cterm=bold ctermfg=196 ctermbg=none
hi LineNr ctermfg=gray ctermbg=none

hi Visual ctermbg=240
