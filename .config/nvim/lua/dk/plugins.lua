-- Install packer
local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
		vim.cmd [[packadd packer.nvim]]
		return true
	end
	return false
end

local packer_bootstrap = ensure_packer()

-- Initialize packer
require('packer').init({
	compile_path = vim.fn.stdpath('data') .. '/site/plugin/packer_compiled.lua',
	display = {
		open_fn = function()
			return require('packer.util').float({ border = 'solid' })
		end,
	},
})

vim.cmd.packadd('packer.nvim')

return require('packer').startup(function(use)
	use 'wbthomason/packer.nvim'
	-- Nice to haves
	use('lukas-reineke/indent-blankline.nvim')
	use('habamax/vim-godot')
	use('andweeb/presence.nvim')
	use('tpope/vim-dispatch')
	use {
		'terrortylor/nvim-comment',
		requires = {
			'JoosepAlviste/nvim-ts-context-commentstring',
		},
	}
	use {
		'nvim-tree/nvim-web-devicons', tag = 'nerd-v2-compat',
	}
	use {
		'airblade/vim-gitgutter',
		branch = 'main',
	}
	use('voldikss/vim-floaterm')
	-- File Nav
	use {
		'nvim-tree/nvim-tree.lua',
		tag = 'nightly' -- optional, updated every week. (see issue #1193)
	}
	use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
	use('nvim-lua/popup.nvim')
	use('ThePrimeagen/harpoon')
	use('nvim-lualine/lualine.nvim')
	use { 'akinsho/bufferline.nvim',
		tag = "*",
	}
	use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
	use('nvim-treesitter/nvim-treesitter-context')

	use({
		'jessarcher/onedark.nvim',
		config = function()
			vim.cmd('colorscheme onedark')

			vim.cmd [[hi NvimTreeNormal guibg=NONE ctermbg=NONE]]
			vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
			vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

			-- Hide the characters in FloatBorder
			vim.api.nvim_set_hl(0, 'FloatBorder', {
				fg = vim.api.nvim_get_hl_by_name('NormalFloat', true).background,
				bg = vim.api.nvim_get_hl_by_name('NormalFloat', true).background,
			})

			-- Make the StatusLineNonText background the same as StatusLine
			vim.api.nvim_set_hl(0, 'StatusLineNonText', {
				fg = vim.api.nvim_get_hl_by_name('NonText', true).foreground,
				bg = vim.api.nvim_get_hl_by_name('StatusLine', true).background,
			})

			-- Hide the characters in CursorLineBg
			vim.api.nvim_set_hl(0, 'CursorLineBg', {
				fg = vim.api.nvim_get_hl_by_name('CursorLine', true).background,
				bg = vim.api.nvim_get_hl_by_name('CursorLine', true).background,
			})

			vim.api.nvim_set_hl(0, 'NvimTreeIndentMarker', { fg = '#30323E' })
			vim.api.nvim_set_hl(0, 'IndentBlanklineChar', { fg = '#2F313C' })
		end,
	})

	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.x',
		-- or                            , branch = '0.1.4',
		requires = { { 'nvim-lua/plenary.nvim' } }
	}

	use {
		'VonHeikemen/lsp-zero.nvim',
		branch = 'v2.x',
		requires = {
			-- LSP Support
			{ 'neovim/nvim-lspconfig' },
			{ 'williamboman/mason.nvim' },
			{ 'williamboman/mason-lspconfig.nvim' },

			-- Autocompletion
			{ 'hrsh7th/nvim-cmp' },
			{ 'hrsh7th/cmp-buffer' },
			{ 'hrsh7th/cmp-path' },
			{ 'saadparwaiz1/cmp_luasnip' },
			{ 'hrsh7th/cmp-nvim-lsp' },
			{ 'hrsh7th/cmp-nvim-lua' },

			-- Snippets
			{ 'L3MON4D3/LuaSnip' },
			{ 'rafamadriz/friendly-snippets' },
		}
	}

	use { 'Olical/conjure' }

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if packer_bootstrap then
		require('packer').sync()
	end
end)
