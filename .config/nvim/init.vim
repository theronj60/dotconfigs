"-------------Imports--------------"
runtime /plug.vim
"runtime /maps.vim

"-------------lua configs------------"
"quick lua configs
lua << EOF
	require('nvim_comment').setup()
EOF

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
let g:rbpt_max = 16
let g:rbpt_loadcmd_toggle = 0

colorscheme onehalfdark

"-------------Vim Setup--------------"
"vim settings"

syntax enable
filetype plugin indent on
set encoding=UTF-8
set noshowmode
set laststatus=2
set tabstop=4
set shiftwidth=4
set number
set relativenumber
set linespace=30
set backspace=indent,eol,start

" Matching tags
let g:vim_matchtag_enable_by_default = 1
let g:vim_matchtag_files = '*.html,*.js,*.jsx,*.vue,*.svelte,*.jsp,*.blade.php'

" Snippets
let g:UltiSnipsExpandTrigger="<leader><tab>"
let g:UltiSnipsJumpForwardTrigger="<leader><c-b>"
let g:UltiSnipsJumpBackwardTrigger="<leader><c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
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
vmap <leader>jk <Esc>

" Vim buffers
nnoremap <leader>bn :bn<CR>
nnoremap <leader>bp :bp<CR>
nnoremap <leader>bd :bd<CR>

" clear highlight search
nnoremap <leader>cl :let @/ = ""<CR> 

" NerdTree mappings
nnoremap <leader>e :NERDTreeFocus<CR>
nnoremap <C-o> :NERDTree<CR>
"nnoremap <leader>i :NERDTreeToggle<CR>
nnoremap <F2> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

"---------movements---------"
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap J mzJ`z
nnoremap <C-u> <C-u>zzzv
nnoremap <C-d> <C-d>zzzv

"---------Windows---------"
nnoremap <leader>ss :split<return><C-w>w
nnoremap <leader>sv :vsplit<return><C-w>w
nnoremap <leader><Space> <C-w>w

"---------text---------"
" moving text
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
inoremap <C-j> <esc>:m .+1<CR>==
inoremap <C-k> <esc>:m .-2<CR>==
nnoremap <leader>j :m.+1<CR>==
nnoremap <leader>k :m.-2<CR>==
" clipboard --c = copy --p = paste
vnoremap <leader>c "*y<CR>
nnoremap <leader>v "*p<CR>
" new line up/down
nnoremap <leader>o o<Esc>
nnoremap <leader>O O<Esc>

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
    " Workaround for creating transparent bg
	autocmd SourcePost * highlight Normal     ctermbg=NONE guibg=NONE
	 	\ |    highlight LineNr     ctermbg=NONE guibg=NONE
	  	\ |    highlight SignColumn ctermbg=NONE guibg=NONE
augroup END
