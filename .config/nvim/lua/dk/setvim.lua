vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.opt.termguicolors = true

-- vim.cmd [[colorscheme tokyonight]]
-- vim.cmd [[colorscheme tokyonight]]
vim.opt.background = "dark"

vim.opt.syntax = "on"
vim.opt.mouse = ""
--vim.opt.t_Co == 256
-- vim.opt.foldmethod = "expr"
-- vim.opt.foldmethod = "indent"
--vim.opt.foldexpr=nvim_treesitter#foldexpr()
--vim.opt.foldlevelstart=99
--vim.opt.foldlevel=2
vim.g.filetype = true

-- local types = { "vue", "tsx", "js", "jsx", "astro", "json", "lua" }
local types = { "json", "lua" }

vim.api.nvim_create_autocmd("FileType", {
	pattern = types,
	callback = function()
		vim.opt.shiftwidth = 2
		vim.opt.softtabstop = 2
		vim.opt.tabstop = 2
	end
})

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4

-- plugin indent on
vim.opt.updatetime = 50
vim.opt.encoding = "UTF-8"
--vim.opt.noshowmode = true
vim.opt.laststatus = 2
vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.hidden = true
vim.opt.wrap = false
vim.opt.scrolloff = 6
vim.opt.linespace = 30
vim.opt.backspace = "indent,eol,start"

-- OSX godot exe
vim.g.godot_executable = '/Applications/Godot.app/Contents/MacOs/Godot'
