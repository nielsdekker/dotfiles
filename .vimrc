call plug#begin('~/.vim/plugged') 
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'https://github.com/kien/ctrlp.vim' 
Plug 'scrooloose/syntastic'
Plug 'flazz/vim-colorschemes'
Plug 'mustache/vim-mustache-handlebars'
Plug 'groenewege/vim-less'
Plug 'itchyny/lightline.vim'
Plug 'joshdick/onedark.vim'
Plug 'morhetz/gruvbox'
Plug 'easymotion/vim-easymotion'
call plug#end()

" numbers settings
let g:numbers_exclude = ['nerdtree']

" vim settings
colorscheme seoul256
set nowrap
set cursorline
set tabstop=4
set shiftwidth=4
set softtabstop=4
set relativenumber
set number

" Custom shortcuts
inoremap <C-p> CtrlP

" CtrlP Setting
let g:ctrlp_custom_ignore = 'node_modules\|tmp\|bower_components\|\.git'

" Lightline Settings
let g:lightline={
	\ 'colorscheme': 'seoul256',
	\ 'component_function': {
	\	'filename': 'LightLineFileName'
	\ }
	\ }
function! LightLineFileName()
	return expand('%')
endfunction

" Syntastic settings
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_ignore_files = ['\m\c\.hbs$']

" Easymotion
map <Leader> <Plug>(easymotion-prefix)
" Zorg dat nerdtree wordt gestart
:NERDTreeToggle

" Custom commands om dingen te fixen
autocmd BufNewFile,BufRead *.json set ft=javascript
