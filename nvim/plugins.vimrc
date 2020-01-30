call plug#begin('~/.vim/plugged')

" Files/navigation
Plug 'tpope/vim-vinegar'
Plug 'easymotion/vim-easymotion'
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'

" Dev tools
Plug 'tpope/vim-fugitive'
Plug 'sheerun/vim-polyglot'
Plug 'neoclide/coc.nvim', { 'branch': 'release' }

" Theming
Plug 'itchyny/lightline.vim'
Plug 'noahfrederick/vim-noctu'
Plug 'arcticicestudio/nord-vim'

call plug#end()
