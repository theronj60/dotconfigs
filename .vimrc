execute pathogen#infect()

filetype plugin indent on
set number
set linespace=30
syntax enable
imap ii <Esc>

"-------------Auto-Commands--------------"

"Automatically source the Vimrc file on save."
augroup autosourcing
    autocmd!
    autocmd BufWritePost .vimrc source %
augroup END
