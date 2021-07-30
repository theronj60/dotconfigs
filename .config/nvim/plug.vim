let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

set nocompatible

" Plugins will be downloaded under the specified directory.
call plug#begin(stdpath('config') . '/plugged')

" Declare the list of plugins.
Plug 'kien/rainbow_parentheses.vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'hoob3rt/lualine.nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'ThePrimeagen/vim-be-good'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update
Plug 'neovim/nvim-lspconfig'
Plug 'glepnir/lspsaga.nvim'
Plug 'nvim-lua/completion-nvim'
Plug 'kristijanhusak/defx-git'
Plug 'kristijanhusak/defx-icons'
Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'joshdick/onedark.vim'

" removed, still setting up
"Plug 'tpope/vim-sensible'
"Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
"Plug 'scrooloose/nerdtree'
"Plug 'valloric/youcompleteme'
"Plug 'itchyny/lightline.vim'
"Plug 'octol/vim-cpp-enhanced-highlight'
"Plug 'pangloss/vim-javascript'
"Plug 'vim-python/python-syntax'
"Plug 'arzg/vim-rust-syntax-ext'
"Plug 'rust-lang/rust.vim'
"Plug 'leafOfTree/vim-vue-plugin'
"Plug 'leafOfTree/vim-svelte-plugin'
"Plug 'ryanoasis/vim-devicons'
"Plug 'sheerun/vim-polyglot'
" List ends here. Plugins become visible to Vim after this call.
call plug#end()

