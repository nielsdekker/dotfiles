" vim settings
set nowrap
set cursorline
set tabstop=4
set shiftwidth=4
set softtabstop=4
set relativenumber
set number
set updatetime=250
set cc=80
let mapleader=" "
set showcmd

" Colors and stuff
syntax enable
set background=light
colorscheme solarized

autocmd BufNewFile,BufRead *.json set ft=javascript
