" Vim Plug Import
runtime ./plug.vim
" Mappings import
runtime ./maps.vim

"-------------Vim Color Scheme--------------"
"Color settings"
set background=dark 
set termguicolors
" Rainbow Parenthesis
let g:rbpt_colorpairs = [
    \ ['darkgray',    'DarkOrchid3'],
\ ]
let g:rbpt_max = 16
let g:rbpt_loadcmd_toggle = 0

colorscheme onehalfdark

lua << EOF
-- vim.opt.list = true
-- vim.opt.listchars = {
--     eol = "↴",
-- }
--
-- require("indent_blankline").setup {
--     show_end_of_line = true,
-- }
EOF

"-------------Vim Setup--------------"
"vim settings"

syntax on
set t_Co=256
filetype plugin indent on
set updatetime=100
set encoding=UTF-8
set noshowmode
set laststatus=2
set tabstop=4 softtabstop=4
set shiftwidth=4
set nu
set relativenumber
set hidden
set nowrap
set scrolloff=6
set linespace=30
set backspace=indent,eol,start
"
" Matching tags
let g:vim_matchtag_enable_by_default = 1
let g:vim_matchtag_files = '*.html,*.js,*.jsx,*.vue,*.svelte,*.jsp,*.php'

" Snippets
let g:UltiSnipsSnippetDirectories = ['UltiSnips']
let g:UltiSnipsExpandTrigger="<leader><tab>"
let g:UltiSnipsJumpForwardTrigger="<leader><c-b>"
let g:UltiSnipsJumpBackwardTrigger="<leader><c-z>"
" Set completion to use Ultisnips
let g:completion_enable_snippet = 'UltiSnips'
"----
let g:rustfmt_autosave = 1
let g:python_highlight_all = 1

"-------------Auto-Commands--------------"
"Automatically source the Vimrc file on save."

augroup autosourcing
    autocmd!
    autocmd BufWritePost $MYVIMRC source %
	autocmd BufRead,BufNewFile *.blade.php set filetype=blade
	" autocmd VimEnter * <cmd>lua require('telescope.builtin').find_files({find_command = {'rg', '--files', '--hidden', '-g', '!.git'}})<cr>
	" Updates git gutter on save
	autocmd BufWritePost * GitGutter
	autocmd	VimEnter * RainbowParenthesesToggle
	autocmd Syntax * RainbowParenthesesLoadRound
	autocmd Syntax * RainbowParenthesesLoadSquare
	autocmd Syntax * RainbowParenthesesLoadBraces
	autocmd Syntax * RainbowParenthesesLoadChevrons
augroup END
