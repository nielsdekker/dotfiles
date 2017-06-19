" vim settings
set nowrap
set cursorline
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
colorscheme seoul256
hi Normal ctermbg=none
hi LineNr ctermbg=none

" Swap file locations
set backupdir=~/.vim/backup//
set directory=~/.vim/swap//
set undodir=~/.vim/undo//

autocmd BufNewFile,BufRead *.json set ft=javascript
