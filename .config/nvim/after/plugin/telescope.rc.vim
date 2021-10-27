if !exists('g:loaded_telescope') | finish | endif

" use inside nvim
nnoremap <silent> <leader>ff <cmd>lua require('telescope.builtin').find_files({find_command = {'rg', '--files', '--hidden', '-g', '!.git'}})<cr>
" nnoremap <silent> <leader>ff <cmd>Telescope find_files<cr>
nnoremap <silent> <leader>r <cmd>Telescope registers theme=ivy<cr>
nnoremap <silent> <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <silent> <leader>fb <cmd>Telescope buffers theme=ivy<cr>
nnoremap <silent> <leader>fh <cmd>Telescope help_tags<cr>
nnoremap <silent> <leader>gb <cmd>Telescope git_branches theme=ivy<cr>
nnoremap <silent> <leader>br <cmd>Telescope file_browser<cr>
nnoremap <silent> <leader>nd <cmd>lua require('tjoe.telescope').search_dot()<cr>
nnoremap <silent> <leader>q <cmd>lua require('tjoe.telescope').show_quick()<cr>
nnoremap <silent> <leader>w <cmd>lua require('telescope.builtin').lsp_document_diagnostics()<cr>

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
	extensions = {
		fzf = {
			fuzzy = true,                    -- false will only do exact matching
		    override_generic_sorter = true,  -- override the generic sorter
			override_file_sorter = true,     -- override the file sorter
			case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
											   -- the default case_mode is "smart_case"
		}
    },
  },
}

require('telescope').load_extension('fzf')
EOF

