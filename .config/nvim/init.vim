"-------------Imports--------------"
runtime /plug.vim

"-------------Vim Color Scheme--------------"
"Color settings"

set background=dark
set termguicolors

if !has('gui_running')
	set t_Co=256
endif
" Rainbow Parenthesis
let g:rbpt_colorpairs = [
    \ ['darkgray',    'DarkOrchid3'],
    \ ]
    "\ ['brown',       'RoyalBlue3'],
    "\ ['Darkblue',    'SeaGreen3'],
    "\ ['darkgreen',   'firebrick3'],
    "\ ['darkcyan',    'RoyalBlue3'],
    "\ ['darkred',     'SeaGreen3'],
    "\ ['darkmagenta', 'DarkOrchid3'],
    "\ ['red',         'firebrick3'],
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

set encoding=UTF-8
syntax enable
filetype plugin indent on
set noshowmode
set laststatus=2
set tabstop=4
set shiftwidth=4
set number
set relativenumber
set linespace=30
set backspace=indent,eol,start

"-------------devSyntax------------"
"let g:vim_vue_plugin_config = {
"   \'syntax': {
"   \   'template': ['html'],
"   \   'script': ['javascript', 'typescript'],
"   \   'style': ['css'],
"   \   'i18n': ['json', 'yaml'],
"   \   'route': 'json',
"   \},
"   \'full_syntax': ['json'],
"  \'initial_indent': ['i18n', 'i18n.json', 'yaml'],
"  \'attribute': 1,
"  \'keyword': 1,
"  \'foldexpr': 0,
"  \'debug': 0,
"\}

"-------------Rust--------------"
"Rust configs"

let g:rustfmt_autosave = 1

"-------------Python--------------"
"Python configs"

let g:python_highlight_all = 1

"-------------Key-Bindings--------------"
"Custom key bindings"

" Vim exit modes
imap jk <Esc>
vmap <leader>j <Esc>

" hightlight search
nnoremap <leader>cl :let @/ = ""<CR>

" NerdTree mappings
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-o> :NERDTree<CR>
nnoremap <C-i> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

" Keep movements centered
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap J mzJ`z
nnoremap <C-u> <C-u>zzzv
nnoremap <C-d> <C-d>zzzv

" Moving text
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
inoremap <C-j> <esc>:m .+1<CR>==
inoremap <C-k> <esc>:m .-2<CR>==
nnoremap <leader>j :m.+1<CR>==
nnoremap <leader>k :m.-2<CR>==

"-------------Auto-Commands--------------"
"Automatically source the Vimrc file on save."

augroup autosourcing
    autocmd!
    autocmd BufWritePost init.vim source %
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
