call plug#begin('~/.vim/plugged')

" Files/navigation
Plug 'tpope/vim-vinegar'
Plug 'easymotion/vim-easymotion'
" Plug 'https://github.com/kien/ctrlp.vim'
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'

" Dev tools
Plug 'tpope/vim-fugitive'
Plug 'w0rp/ale'
Plug 'sheerun/vim-polyglot'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }

" Theming
Plug 'itchyny/lightline.vim'
Plug 'ayu-theme/ayu-vim'
Plug 'drewtempelmeyer/palenight.vim'
Plug 'yarisgutierrez/ayu-lightline'
Plug 'NLKNguyen/papercolor-theme'

call plug#end()
