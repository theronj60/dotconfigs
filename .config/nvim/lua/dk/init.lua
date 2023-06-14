require('dk.plugins')
require('dk.remaps')
require('dk.setvim')

local augroup = vim.api.nvim_create_augroup
local DkGroup = augroup('dk', {})
local autocmd = vim.api.nvim_create_autocmd

function R(name)
	require("plenary.reload").reload_module(name)
end

autocmd({ "BufWritePre" }, {
	group = DkGroup,
	pattern = "*",
	command = [[%s/\s\+$//e]],
})

local function open_nvim_tree(data)
	-- buffer is a [No Name]
	local no_name = data.file == "" and vim.bo[data.buf].buftype == ""

	-- buffer is a directory
	local directory = vim.fn.isdirectory(data.file) == 1

	if not no_name and not directory then
		return
	end

	-- change to the directory
	if directory then
		vim.cmd.cd(data.file)
	end

	-- open the tree
	require("nvim-tree.api").tree.open()
end

vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })

-- start conjure in file
vim.cmd([[
	let g:conjure#filetypes = ["scheme"]
	let g:conjure#client#scheme#stdio#command = "csi -quiet -:c"
	let g:conjure#client#scheme#stdio#prompt_pattern = "\n-#;%d-> "
	" let g:conjure#log#hud#passive_close_delay = "99999"
]])

vim.cmd([[
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
	augroup END
]])
