" vim settings
set nocompatible
syntax enable
set number
set relativenumber
set showcmd
set noshowmode
set ignorecase
set signcolumn=yes

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
let ayucolor="light" " only used by the ayu colorscheme
colorscheme ayu

" Autocommands
autocmd BufNewFile,BufRead *.csst set ft=css

