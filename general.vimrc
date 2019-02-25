" vim settings
set nocompatible
syntax enable
set number
set relativenumber
set showcmd
set noshowmode
set ignorecase

" Tabs/spaces
set nowrap
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab

let &colorcolumn="80,".join(range(120,999),",")
let mapleader=" "

" Theming
set termguicolors
set background=light
let ayucolor="light"
colorscheme ayu

" Autocommands
autocmd BufNewFile,BufRead *.json set ft=javascript
autocmd BufNewFile,BufRead *.csst set ft=css
