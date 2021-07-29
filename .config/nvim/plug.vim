let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

set nocompatible

" Plugins will be downloaded under the specified directory.
call plug#begin(stdpath('config') . '/plugged')

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
"Plug 'sheerun/vim-polyglot'
Plug 'arzg/vim-rust-syntax-ext'
Plug 'valloric/youcompleteme'
Plug 'pangloss/vim-javascript'
Plug 'leafOfTree/vim-vue-plugin'
Plug 'leafOfTree/vim-svelte-plugin'
Plug 'tpope/vim-rhubarb'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'joshdick/onedark.vim'
" List ends here. Plugins become visible to Vim after this call.
call plug#end()

