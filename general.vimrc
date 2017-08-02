" vim settings
set nowrap
set tabstop=4
set shiftwidth=4
set softtabstop=4
set number
set updatetime=1000
set cc=120
let mapleader=" "
set showcmd
set lazyredraw

" Colors and stuff
syntax enable
set background=dark
colorscheme gruvbox

" Swap file locations
set backupdir=~/.vim/backup//
set directory=~/.vim/swap//
set undodir=~/.vim/undo//

autocmd BufNewFile,BufRead *.json set ft=javascript
