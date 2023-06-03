" buffer control"
nnoremap <silent> <C-j> :bprevious<CR>
nnoremap <silent> <C-k> :bnext<CR>

" tabpage control
nnoremap st :tabnew<CR>
nnoremap sn :tabnext<CR>
nnoremap sp :tabprevious<CR>
nnoremap sc :tabclose<CR>

" Ctrl-nでNERDTreeを開く
map <C-n> :NERDTreeToggle<CR>
