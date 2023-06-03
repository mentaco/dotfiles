source ~/.vim/dein.vim
for f in globpath('~/.vim/config', '*.vim', 0, 1, 0)
    execute 'source' f
endfor

for f in globpath('~/.vim/plugins', '*.vim', 0, 1, 0)
    execute 'source' f
endfor
