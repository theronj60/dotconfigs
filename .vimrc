execute pathogen#infect()

"-------------Vim Color Scheme--------------"
"Color settings"

set background=dark
if !has('gui_running')
	set t_Co=256
endif
let g:lightline = {
	\ 'colorscheme': 'onedark',
	\ 'active': {
	\	'left': [ [ 'mode', 'paste' ],
	\		[ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
	\ },
	\ 'component_function': {
	\ 	'gitbranch': 'FugitiveHead'
	\ },
\}
colorscheme onedark

"-------------Vim Setup--------------"
"vim settings"

set noshowmode
set laststatus=2
filetype plugin indent on
set number
set linespace=30
syntax enable

"-------------Key-Bindings--------------"
"Custom key bindings"

imap ii <Esc>

"-------------Auto-Commands--------------"
"Automatically source the Vimrc file on save."

augroup autosourcing
    autocmd!
    autocmd BufWritePost .vimrc source %
augroup END
