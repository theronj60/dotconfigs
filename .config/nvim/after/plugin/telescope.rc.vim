if !exists('g:loaded_telescope') | finish | endif

" use inside nvim
nnoremap <silent> <leader>ff <cmd>lua require('telescope.builtin').find_files({find_command = {'rg', '--files', '--hidden', '-g', '!.git'}})<cr>
nnoremap <silent> <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <silent> <leader>fb <cmd>Telescope buffers<cr>
nnoremap <silent> <leader>fh <cmd>Telescope help_tags<cr>
nnoremap <silent> <leader>gb <cmd>Telescope git_branches<cr>
nnoremap <silent> <leader>br <cmd>Telescope file_browser<cr>
nnoremap <silent> <leader>nd <cmd>lua require('tjoe.telescope').search_dot()<cr>

lua << EOF
local actions = require('telescope.actions')
-- Global remapping
------------------------------
require('telescope').setup{
defaults = {
	vimgrep_arguments = {
		'rg',
		'--hidden',
		'--glob=!.git/*',
		'--color=never',
		'--no-heading',
		'--with-filename',
		'--line-number',
		'--column',
		'--smart-case'
	},
    mappings = {
		n = {
			["q"] = actions.close,
			["rb"] = "delete_buffer",
		},
    },
  },
}
EOF

