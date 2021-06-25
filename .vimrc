execute pathogen#infect()

"-------------Vim Color Scheme--------------"
"Color settings"

set background=dark
if !has('gui_running')
	set t_Co=256
endif
" Rainbow Parenthesis
let g:rbpt_colorpairs = [
    "\ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    "\ ['darkgray',    'DarkOrchid3'],
    "\ ['darkgreen',   'firebrick3'],
    "\ ['darkcyan',    'RoyalBlue3'],
    "\ ['darkred',     'SeaGreen3'],
    "\ ['darkmagenta', 'DarkOrchid3'],
    "\ ['brown',       'firebrick3'],
    "\ ['gray',        'RoyalBlue3'],
    "\ ['black',       'SeaGreen3'],
    "\ ['darkmagenta', 'DarkOrchid3'],
    "\ ['Darkblue',    'firebrick3'],
    "\ ['darkgreen',   'RoyalBlue3'],
    "\ ['darkcyan',    'SeaGreen3'],
    "\ ['darkred',     'DarkOrchid3'],
    "\ ['red',         'firebrick3'],
    \ ]
let g:rbpt_max = 16
let g:rbpt_loadcmd_toggle = 0
" Status Line
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
set backspace=indent,eol,start

"-------------Rust--------------"
"Rust configs"

let g:rustfmt_autosave = 1

"-------------Python--------------"
"Python configs"

let g:python_highlight_all = 1

"-------------Key-Bindings--------------"
"Custom key bindings"

imap jk <Esc>

"-------------Auto-Commands--------------"
"Automatically source the Vimrc file on save."

augroup autosourcing
    autocmd!
    autocmd BufWritePost .vimrc source %
	autocmd	VimEnter * RainbowParenthesesToggle
	autocmd Syntax * RainbowParenthesesLoadRound
	autocmd Syntax * RainbowParenthesesLoadSquare
	autocmd Syntax * RainbowParenthesesLoadBraces
	autocmd Syntax * RainbowParenthesesLoadChevrons
	"Workaround for creating transparent bg
    autocmd SourcePost * highlight Normal     ctermbg=NONE guibg=NONE
            \ |    highlight LineNr     ctermbg=NONE guibg=NONE
            \ |    highlight SignColumn ctermbg=NONE guibg=NONE
augroup END
