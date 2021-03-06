let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

set nocompatible

" Plugins will be downloaded under the specified directory.
call plug#begin(stdpath('config') . '/plugged')

" Declare the list of plugins.
"----Nice to haves
Plug 'kien/rainbow_parentheses.vim'
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'leafOfTree/vim-matchtag'
Plug 'cohama/lexima.vim'
Plug 'terrortylor/nvim-comment'
Plug 'sirver/ultisnips'
Plug 'honza/vim-snippets'
Plug 'ThePrimeagen/git-worktree.nvim'
Plug 'ThePrimeagen/vim-be-good'
Plug 'andweeb/presence.nvim'
Plug 'tpope/vim-dispatch'
"----Icons
Plug 'kyazdani42/nvim-web-devicons'
Plug 'ryanoasis/vim-devicons'
"----Git
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'airblade/vim-gitgutter'
"----File nav
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
Plug 'kyazdani42/nvim-tree.lua'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'ThePrimeagen/harpoon'
"----Theme
Plug 'navarasu/onedark.nvim'
"Plug 'sonph/onehalf', { 'rtp': 'vim' }
Plug 'nvim-lualine/lualine.nvim'
Plug 'akinsho/bufferline.nvim'
"----Diagnostic
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update
"----Auto-Completion
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'quangnguyen30192/cmp-nvim-ultisnips'
"
"----Language Servers
Plug 'neovim/nvim-lspconfig'
" Plug 'tami5/lspsaga.nvim'
Plug 'glepnir/lspsaga.nvim', { 'branch': 'main' }
Plug 'williamboman/nvim-lsp-installer'

" List ends here. Plugins become visible to Vim after this call.
call plug#end()

