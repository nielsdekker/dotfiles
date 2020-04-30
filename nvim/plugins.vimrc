call plug#begin('~/.vim/plugged')

" Files/navigation
Plug 'tpope/vim-vinegar'
Plug 'easymotion/vim-easymotion'
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'

" Dev tools
Plug 'tpope/vim-fugitive'
Plug 'sheerun/vim-polyglot'
Plug 'neoclide/coc.nvim', { 'do': 'yarn install --frozen-lockfile' }

" Theming / syntax
Plug 'pangloss/vim-javascript'
Plug 'itchyny/lightline.vim'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
Plug 'ayu-theme/ayu-vim'
Plug 'cocopon/iceberg.vim'
Plug 'arcticicestudio/nord-vim'
Plug 'noahfrederick/vim-noctu'
Plug 'challenger-deep-theme/vim'
Plug 'rakr/vim-two-firewatch'
Plug 'morhetz/gruvbox'

call plug#end()
