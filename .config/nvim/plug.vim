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
Plug 'habamax/vim-godot'
" Plug 'ThePrimeagen/git-worktree.nvim'
Plug 'ThePrimeagen/vim-be-good'
Plug 'andweeb/presence.nvim'
Plug 'tpope/vim-dispatch'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }
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
" Plug 'jessarcher/onedark.nvim'
Plug 'navarasu/onedark.nvim'
Plug 'nvim-lualine/lualine.nvim'
Plug 'akinsho/bufferline.nvim', { 'tag': 'v2.*' }
"----Diagnostic
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update
Plug 'nvim-treesitter/nvim-treesitter-context'
"----Auto-Completion
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'quangnguyen30192/cmp-nvim-ultisnips'
"
"----Language Servers
Plug 'neovim/nvim-lspconfig'
Plug 'glepnir/lspsaga.nvim', { 'branch': 'main' }
Plug 'williamboman/mason.nvim'
Plug 'williamboman/mason-lspconfig.nvim'
Plug 'Olical/conjure'

" List ends here. Plugins become visible to Vim after this call.
call plug#end()

