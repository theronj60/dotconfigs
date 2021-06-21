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
set tabstop=4
set shiftwidth=4
set number
set linespace=30
syntax enable

"-------------Rust--------------"
"Rust configs"

let g:rustfmt_autosave = 1

"-------------Key-Bindings--------------"
"Custom key bindings"

imap ii <Esc>

"-------------Auto-Commands--------------"
"Automatically source the Vimrc file on save."

augroup autosourcing
    autocmd!
    autocmd BufWritePost .vimrc source %
	"Workaround for creating transparent bg
    autocmd SourcePost * highlight Normal     ctermbg=NONE guibg=NONE
            \ |    highlight LineNr     ctermbg=NONE guibg=NONE
            \ |    highlight SignColumn ctermbg=NONE guibg=NONE
augroup END
