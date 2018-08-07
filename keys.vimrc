" input
nnoremap <Leader>p :CtrlP<CR>
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
inoremap <expr><S-tab> pumvisible() ? "\<c-p>" : "\<S-tab>"

" terminal
tnoremap <Esc> <C-\><C-n>

" leader commands
" ctrl p
nnoremap <Leader>p :CtrlP<CR>

" terminal
if has("win32")
	nnoremap <Leader>t :terminal<CR>
else
	nnoremap <Leader>t :terminal fish<CR>
endif

" git/fugitive
nmap <Leader>gw :Gwrite<CR>
nmap <Leader>gs :ToggleGStatus<CR>
nmap <Leader>gc :Gcommit<CR>
nmap <Leader>gp :Gpush<CR>
nmap <Leader>gn :GitGutterNextHunk<CR>
nmap <Leader>gN :GitGutterPrevHunk<CR>

" nerdtree
nnoremap <Leader>nt :NERDTreeToggle<CR>
nnoremap <Leader>nf :NERDTreeFind<CR>

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
