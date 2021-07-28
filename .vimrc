let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

set nocompatible

" Plugins will be downloaded under the specified directory.
call plug#begin(has("nvim") ? stdpath('config') . '/plugged' : '~/.vim/plugged')

" Declare the list of plugins.
Plug 'tpope/vim-sensible'
Plug 'itchyny/lightline.vim'
Plug 'scrooloose/nerdtree'
Plug 'vim-python/python-syntax'
Plug 'kien/rainbow_parentheses.vim'
Plug 'rust-lang/rust.vim'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'ryanoasis/vim-devicons'
Plug 'tpope/vim-fugitive'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'sheerun/vim-polyglot'
Plug 'arzg/vim-rust-syntax-ext'
Plug 'valloric/youcompleteme'
Plug 'joshdick/onedark.vim'
" List ends here. Plugins become visible to Vim after this call.
call plug#end()



"-------------Vim Color Scheme--------------"
"Color settings"

set background=dark
set termguicolors

if !has('gui_running')
	set t_Co=256
endif
" Rainbow Parenthesis
let g:rbpt_colorpairs = [
    "\ ['brown',       'RoyalBlue3'],
    "\ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    "\ ['darkgreen',   'firebrick3'],
    "\ ['darkcyan',    'RoyalBlue3'],
    "\ ['darkred',     'SeaGreen3'],
    "\ ['darkmagenta', 'DarkOrchid3'],
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

syntax enable
filetype plugin indent on
set noshowmode
set laststatus=2
set tabstop=4
set shiftwidth=4
"set number
set linespace=30
set backspace=indent,eol,start
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

"-------------devSyntax------------"
let g:vim_vue_plugin_config = {
   \'syntax': {
   \   'template': ['html'],
   \   'script': ['javascript', 'typescript'],
   \   'style': ['css'],
   \   'i18n': ['json', 'yaml'],
   \   'route': 'json',
   \},
   \'full_syntax': ['json'],
   \'initial_indent': ['i18n', 'i18n.json', 'yaml'],
   \'attribute': 1,
   \'keyword': 1,
   \'foldexpr': 0,
   \'debug': 0,
\}

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
