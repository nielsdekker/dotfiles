" CtrlP Setting
let g:ctrlp_custom_ignore = 'node_modules\|tmp\|bower_components\|\.git'

" Syntastic settings
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_ignore_files = ['\m\c\.hbs$']
let g:syntastic_javascript_checkers = ['eslint']

" Auto close the preview window in ycm
let g:ycm_autoclose_preview_window_after_completion = 0
let g:ycm_autoclose_preview_window_after_insertion = 1

" Easymotion
let g:EasyMotion_do_mapping = 0

" Editorconfig
let g:Editorconfig_exclude_patters = ['fugitive://.*']

" Zorg dat nerdtree wordt gestart
:NERDTreeToggle
