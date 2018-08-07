call plug#begin('~/.vim/plugged')

" Theming
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ayu-theme/ayu-vim'

" Files / navigation
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'easymotion/vim-easymotion'
Plug 'rking/ag.vim'
Plug 'https://github.com/kien/ctrlp.vim'

" Dev
Plug 'tpope/vim-fugitive'
Plug 'pangloss/vim-javascript'
Plug 'w0rp/ale'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }

call plug#end()
