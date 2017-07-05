" vim settings
set nowrap
set tabstop=4
set shiftwidth=4
set softtabstop=4
set relativenumber
set number
set updatetime=250
set cc=120
let mapleader=" "
set showcmd

" Colors and stuff
syntax enable
colorscheme wal

" Swap file locations
set backupdir=~/.vim/backup//
set directory=~/.vim/swap//
set undodir=~/.vim/undo//

autocmd BufNewFile,BufRead *.json set ft=javascript
