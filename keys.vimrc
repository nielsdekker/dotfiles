" normal
nnoremap <Leader>nt :NERDTreeToggle<CR>
nnoremap <Leader>nf :NERDTreeFind<CR>
" removes all trailing whitespace
nnoremap <F9> :set list!<CR>
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

" leader commands
" git/fugitive
nmap <Leader>gw :Gwrite<CR>
nmap <Leader>gs :ToggleGStatus<CR>
nmap <Leader>gc :Gcommit<CR>
nmap <Leader>gp :Gpush<CR>
nmap <Leader>gn :GitGutterNextHunk<CR>
nmap <Leader>gN :GitGutterPrevHunk<CR>

" motion/easymotion
nmap <Leader>s <Plug>(easymotion-s)
nmap <Leader>j <Plug>(easymotion-j)
nmap <Leader>k <Plug>(easymotion-k)

" errors, warnings/ale
nmap <Leader>aj :ALENext<CR>
nmap <Leader>ak :ALEPrevious<CR>

" terminal
nmap <Leader>t :sp<CR>:terminal fish<CR>

" Disable arrow keys
inoremap <Up> <nop>
nnoremap <Up> <nop>
inoremap <Down> <nop>
nnoremap <Down> <nop>
inoremap <Left> <nop>
nnoremap <Left> <nop>
inoremap <Right> <nop>
nnoremap <Right> <nop>
