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
set background=light
set termguicolors
colorscheme PaperColor

autocmd BufNewFile,BufRead *.json set ft=javascript
