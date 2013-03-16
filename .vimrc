syntax on
set number
set tabstop=4
au BufRead,BufNewFile *.gss set filetype=css
au BufRead,BufNewFile *.scss set filetype=css
au BufRead,BufNewFile *.styl set filetype=css
au BufWritePost        *.styl
            \ make
