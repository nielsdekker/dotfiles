function! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun

" Removes trailing whitespace on save
autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()
