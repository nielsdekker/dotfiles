call plug#begin('~/.vim/plugged') 
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'https://github.com/kien/ctrlp.vim' 
Plug 'wookiehangover/jshint.vim'
Plug 'flazz/vim-colorschemes'
Plug 'fholgado/minibufexpl.vim'
Plug 'myusuf3/numbers.vim'
Plug 'mustache/vim-mustache-handlebars'
Plug 'groenewege/vim-less'
call plug#end()

" numbers settings
let g:numbers_exclude = ['nerdtree']

" vim settings
colorscheme summerfruit256
set nowrap
set cursorline
set tabstop=4
set shiftwidth=4
set softtabstop=4

" Custom shortcuts
inoremap <C-p> CtrlP

" CtrlP Setting
let g:ctrl_p_custom_ignore = {
	\ 'dir': 'node_modules\|tmp\|bower_components\|\.git'
	\ }

" Zorg dat nerdtree wordt gestart
:NERDTreeToggle
