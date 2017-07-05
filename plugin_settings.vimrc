" airline Settings
let g:airline_powerline_fonts = 0
let g:airline#extensions#whitespace#mixed_indent_algo = 1
let g:airline#extensions#tabline#enabled = 0
let g:airline_theme = 'base16_chalk'

" CtrlP Setting
let g:ctrlp_custom_ignore = 'node_modules\|tmp\|bower_components\|\.git'

" Ale
let g:ale_linters = {
\   'javascript': ['eslint'],
\}
let g:ale_open_list = 1
let g:ale_javascript_eslint_use_global = 1
let g:ale_lint_on_text_changed = 'normal'

" YouCompleteMe
let g:ycm_autoclose_preview_window_after_completion = 0
let g:ycm_autoclose_preview_window_after_insertion = 1

" Easymotion
let g:EasyMotion_do_mapping = 0

" Editorconfig
let g:Editorconfig_exclude_patters = ['fugitive://.*']

" Zorg dat nerdtree wordt gestart
:NERDTreeToggle
