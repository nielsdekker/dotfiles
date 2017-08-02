" airline Settings
let g:airline_powerline_fonts = 0
let g:airline#extensions#whitespace#mixed_indent_algo = 1
let g:airline_extensions = ['whitespace', 'ctrlp', 'ale']
let g:airline#extensions#tabline#enabled = 0
let g:airline_theme = 'gruvbox'

" CtrlP Setting
let g:ctrlp_custom_ignore = 'node_modules\|tmp\|bower_components\|\.git'

" Ale
let g:ale_linters = {
\   'javascript': ['eslint'],
\}
let g:ale_open_list = 0
let g:ale_set_quickfix = 0
let g:ale_set_loclist = 0
let g:ale_javascript_eslint_use_global = 1
let g:ale_lint_on_text_changed = 'never'

" Easymotion
let g:EasyMotion_do_mapping = 0

" Editorconfig
let g:Editorconfig_exclude_patters = ['fugitive://.*']

" Javascript
let g:javascript_plugin_jsdoc = 1

" Deoplete
let g:deoplete#enable_at_startup = 1

" Goyo
let g:goyo_width = 150

" Zorg dat nerdtree wordt gestart
:NERDTreeToggle
