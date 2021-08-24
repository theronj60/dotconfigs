if !exists('g:loaded_telescope') | finish | endif

" use inside nvim
nnoremap <silent> <leader>ff <cmd>Telescope find_files<cr>
nnoremap <silent> <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <silent> <leader>fb <cmd>Telescope buffers<cr>
nnoremap <silent> <leader>fh <cmd>Telescope help_tags<cr>
nnoremap <silent> <leader>gb <cmd>Telescope git_branches<cr>
" nnoremap <silent> gd <cmd>lua require('telescope.builtin').edit_dot()<cr>

" functions
" lua << EOF
" local M = {}
" 
" function edit_dot()
" 	require('telescope.builtin').find_files {
" 		shorten_path = false,
" 		cwd = "~/dotconfigs",
" 		prompt = "~ dotfiles ~",
" 		layout_strategy = 'horizontal',
" 		layout_options = {
" 			preview_width = 0.75,
" 		},
" 	}
" end

lua << EOF
local actions = require('telescope.actions')
-- Global remapping
------------------------------
require('telescope').setup{
  defaults = {
    mappings = {
      n = {
        ["q"] = actions.close
      },
    },
  }
}
EOF

