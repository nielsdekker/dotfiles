" CtrlP Setting
" let g:ctrlp_custom_ignore = 'node_modules\|tmp\|bower_components\|\.git\|target'

if has("win32")
	let g:python3_host_prog = 'C:\Python38\python.exe'
endif

" FZF
let $FZF_DEFAULT_COMMAND = 'ag -g ""'
" This piece of magic code makes sure :Ag only searches file contents and not
" file names
command! -bang -nargs=* Ag call fzf#vim#ag(<q-args>, {'options': '--delimiter : --nth 4..'}, <bang>0)

" Easymotion
let g:EasyMotion_do_mapping = 0

" Javascript / vim-javascript
let g:javascript_plugin_jsdoc = 1

