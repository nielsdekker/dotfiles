" input
inoremap <C-p> CtrlP
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

" normal
nnoremap <F2> :NERDTreeToggle<CR>
nnoremap <F3> :NERDTreeFind<CR>
" removes all trailing whitespace
nnoremap <F8> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>
nnoremap <F9> :set list!<CR>

" leader commands
nmap <Leader>gw :Gwrite<CR>
nmap <Leader>gs :ToggleGStatus<CR>
nmap <Leader>gc :Gcommit<CR>
nmap <Leader>gp :Gpush<CR>
nmap <Leader>gn :GitGutterNextHunk<CR>
nmap <Leader>gN :GitGutterPrevHunk<CR>

nmap <Leader>s <Plug>(easymotion-s)
nmap <Leader>j <Plug>(easymotion-j)
nmap <Leader>k <Plug>(easymotion-k)

nmap <Leader>yc :YcmCompleter RefactorRename
nmap <Leader>yd :YcmCompleter GetDoc<CR>
nmap <Leader>yo :YcmCompleter GoToDefinition<CR>
nmap <Leader>yr :YcmCompleter GoToReferences<CR>
