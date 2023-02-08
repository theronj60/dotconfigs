vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.opt.termguicolors = true

-- vim.cmd [[colorscheme tokyonight]]
-- vim.cmd [[colorscheme tokyonight]]
vim.opt.background = "dark"

vim.cmd[[hi NvimTreeNormal guibg=NONE ctermbg=NONE]]
vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

--syntax on
vim.opt.mouse = ""
--vim.opt.t_Co == 256
--vim.opt.foldmethod=expr
--vim.opt.foldexpr=nvim_treesitter#foldexpr()
--vim.opt.foldlevelstart=99
--vim.opt.foldlevel=2
--filetype plugin indent on
vim.opt.updatetime = 50
vim.opt.encoding = "UTF-8"
--vim.opt.noshowmode = true
vim.opt.laststatus = 2
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.hidden = true
vim.opt.wrap = false
vim.opt.scrolloff = 6
vim.opt.linespace = 30
vim.opt.backspace = "indent,eol,start"

-- OSX godot exe
vim.g.godot_executable = '/Applications/Godot.app/Contents/MacOs/Godot'
