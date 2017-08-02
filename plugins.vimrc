call plug#begin('~/.vim/plugged')
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'https://github.com/kien/ctrlp.vim'
Plug 'w0rp/ale'
Plug 'mustache/vim-mustache-handlebars'
Plug 'groenewege/vim-less'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'easymotion/vim-easymotion'
Plug 'tpope/vim-fugitive'
Plug 'rking/ag.vim'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }
Plug 'morhetz/gruvbox'
Plug 'junegunn/goyo.vim'
call plug#end()
