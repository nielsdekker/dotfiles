" vim settings
set nowrap
set tabstop=4
set shiftwidth=4
set softtabstop=4
set number
let &colorcolumn="80,".join(range(120,999),",")
let mapleader=" "
set showcmd

" Colors and stuff
syntax enable
set termguicolors
let ayucolor="mirage"
colorscheme ayu

" Swap file locations
set backupdir=~/.vim/backup//
set directory=~/.vim/swap//
set undodir=~/.vim/undo//

autocmd BufNewFile,BufRead *.json set ft=javascript
