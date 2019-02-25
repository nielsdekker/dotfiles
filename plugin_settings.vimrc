" CtrlP Setting
let g:ctrlp_custom_ignore = 'node_modules\|tmp\|bower_components\|\.git\|target'

if has("win32")
	let g:python3_host_prog = 'C:\Python36\python.exe'
endif

" FZF
let $FZF_DEFAULT_COMMAND = 'ag -g ""'
" This piece of magic code makes sure :Ag only searches file contents and not
" file names
command! -bang -nargs=* Ag call fzf#vim#ag(<q-args>, {'options': '--delimiter : --nth 4..'}, <bang>0)

" Ale
let g:ale_linters = {
\  'javascript': ['eslint'],
\}
let g:ale_open_list = 0
let g:ale_set_quickfix = 0
let g:ale_set_loclist = 0
let g:ale_javascript_eslint_use_global = 1
let g:ale_lint_on_text_changed = 'never'

" Easymotion
let g:EasyMotion_do_mapping = 0

" Javascript / vim-javascript
let g:javascript_plugin_jsdoc = 1

" Deoplete
let g:deoplete#enable_at_startup = 1

" Lightline
let g:lightline = {
      \ 'colorscheme': 'PaperColor'
      \ }

