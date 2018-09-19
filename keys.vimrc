" input
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
inoremap <expr><S-tab> pumvisible() ? "\<c-p>" : "\<S-tab>"

" terminal
tnoremap <Esc> <C-\><C-n>

" leader commands
nmap <Leader>tt :tabnew
nmap <Leader>th :tabprevious<CR>
nmap <Leader>tl :tabnext<CR>
nmap <Leader>tr :tabrename

nmap <Leader>wl <C-w>l
nmap <Leader>wk <C-w>k
nmap <Leader>wj <C-w>j
nmap <Leader>wh <C-w>h

" ctrl p
nnoremap <Leader>p :CtrlP<CR>

" motion/easymotion
nmap <Leader>s <Plug>(easymotion-s)
nmap <Leader>j <Plug>(easymotion-j)
nmap <Leader>k <Plug>(easymotion-k)

" errors, warnings/ale
nmap <Leader>aj :ALENext<CR>
nmap <Leader>ak :ALEPrevious<CR>

" Disable arrow keys
inoremap <Up> <nop>
nnoremap <Up> <nop>
inoremap <Down> <nop>
nnoremap <Down> <nop>
inoremap <Left> <nop>
nnoremap <Left> <nop>
inoremap <Right> <nop>
nnoremap <Right> <nop>
