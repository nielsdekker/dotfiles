" input
" inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
" inoremap <expr><S-tab> pumvisible() ? "\<c-p>" : "\<S-tab>"
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

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
nnoremap <Leader>p :FZF<CR>
nnoremap <Leader>f :Ag<CR>

" motion/easymotion
nmap <Leader>s <Plug>(easymotion-s)
nmap <Leader>j <Plug>(easymotion-j)
nmap <Leader>k <Plug>(easymotion-k)

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Navigation between definitions
nmap gd <Plug>(coc-definition)
nmap gr <Plug>(coc-references)
nmap <Leader>o :<C-u>CocList outline<cr>

" Use K to show documentation in preview window
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

nnoremap <silent> K :call <SID>show_documentation()<CR>

" Refactor tools
nmap <Leader>rr <Plug>(coc-rename)

" Disable arrow keys
inoremap <Up> <nop>
nnoremap <Up> <nop>
inoremap <Down> <nop>
nnoremap <Down> <nop>
inoremap <Left> <nop>
nnoremap <Left> <nop>
inoremap <Right> <nop>
nnoremap <Right> <nop>
