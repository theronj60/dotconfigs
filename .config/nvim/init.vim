" Vim Plug Import
runtime ./plug.vim
"Mappings import
runtime ./maps.vim

"-------------Vim Color Scheme--------------"
"Color settings"
set background=dark
set termguicolors

let g:netrw_banner = 0

" Rainbow Parenthesis
let g:rbpt_colorpairs = [
    \ ['darkgray',    'DarkOrchid3'],
\ ]
let g:rbpt_max = 16
let g:rbpt_loadcmd_toggle = 0

" set colorscheme based on time
" use vimdark from 9pm to 10am
" if strftime("%H") >= 21 || strftime("%H") <= 9
"     colorscheme vimdark
" else
"     colorscheme vimlight
" endif

let g:conjure#client#scheme#stdio#command = "csi -quiet -:c"
let g:conjure#client#scheme#stdio#prompt_pattern = "\n-#;%d-> "

" OSX godot exe
let g:godot_executable = '/Applications/Godot.app/Contents/MacOs/Godot'

"-------------Vim Setup--------------"
"vim settings"

syntax on
set mouse=
set t_Co=256
set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()
set foldlevelstart=99
set foldlevel=2
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

" Matching tags
let g:vim_matchtag_enable_by_default = 1
let g:vim_matchtag_files = '*.astro,*.html,*.js,*.jsx,*.vue,*.svelte,*.jsp,*.php,*.blade'

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

" Sources for the checktime autocmd
" https://unix.stackexchange.com/questions/149209/refresh-changed-content-of-file-opened-in-vim/383044#383044
" https://vi.stackexchange.com/questions/13692/prevent-focusgained-autocmd-running-in-command-line-editing-mode
" https://vi.stackexchange.com/questions/13091/autocmd-event-for-autoread

augroup autosourcing
    autocmd!
    autocmd BufWritePost $MYVIMRC source %
	autocmd BufRead,BufNewFile *.blade.php set filetype=blade
	autocmd BufRead,BufEnter *.astro set filetype=astro
	" Trigger `autoread` when files changes on disk
	autocmd FocusGained,BufEnter,CursorHold,CursorHoldI *
		\ if mode() !~ '\v(c|r.?|!|t)' && getcmdwintype() == '' | checktime | endif
	" Notification after file change
	autocmd FileChangedShellPost *
	  \ echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None
	" Updates git gutter on save
	autocmd BufWritePost * GitGutter
	autocmd	VimEnter * RainbowParenthesesToggle
	autocmd Syntax * RainbowParenthesesLoadRound
	autocmd Syntax * RainbowParenthesesLoadSquare
	autocmd Syntax * RainbowParenthesesLoadBraces
	autocmd Syntax * RainbowParenthesesLoadChevrons
augroup END
