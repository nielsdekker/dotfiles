" CtrlP Setting
let g:ctrlp_custom_ignore = 'node_modules\|tmp\|bower_components\|\.git'

" Syntastic settings
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_ignore_files = ['\m\c\.hbs$']

" Switch between jshint or eslint depending on whether or not the
" `rc` file for the different plugins is available. When both are
" available eslint is used.
if filereadable("./.jshintrc")
	let g:syntastic_javascript_checkers = ['jshint']
endif
if filereadable("./.eslintrc.js")
	let g:syntastic_javascript_checkers = ['eslint']
endif

" Auto close the preview window in ycm
let g:ycm_autoclose_preview_window_after_completion = 0
let g:ycm_autoclose_preview_window_after_insertion = 1

" Easymotion
let g:EasyMotion_do_mapping = 0

" Zorg dat nerdtree wordt gestart
:NERDTreeToggle
