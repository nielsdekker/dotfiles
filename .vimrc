set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Let vundle manage vundle (required)
Plugin 'gmarik/Vundle.vim'

" Nerdtree plugin from github
Plugin 'scrooloose/nerdtree'

" Scrooloose plugin from github
Plugin 'scrooloose/syntastic'

" Tern for vim (javascript)
Plugin 'marijnh/tern_for_vim'

call vundle#end()

filetype plugin indent on

" Change tabs settings
set tabstop=2
set shiftwidth=2
set softtabstop=2
set smarttab
set expandtab

" Custom keyboard shortcuts
map <C-S-r> <Esc>:TernRename<CR>
map <C-A-Left> <Esc>:wincmd h<CR>
map <C-A-Right> <Esc>:wincmd l<CR>

" Activate plugins
autocmd VimEnter * NERDTree
autocmd VimEnter * wincmd p
