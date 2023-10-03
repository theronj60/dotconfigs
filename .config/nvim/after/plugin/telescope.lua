local builtin = require('telescope.builtin')
-- vim.keymap.set('n', '<leader>ff', builtin.find_files(), {find_command = {'rg', '--files', '--hidden', '-g', '!.git'}})
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
--vim.keymap.set('n', '<leader>r', builtin.registers, {theme=ivy})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
--vim.keymap.set('n', '<leader>fb', builtin.buffers, {theme=ivy})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
--vim.keymap.set('n', '<leader>nd', function() require('dk.telescope').search_dot() end)
--vim.keymap.set('n', '<leader>q', function() require('dk.telescope').show_quick() end)
-- " nnoremap <silent> <leader>w <cmd>lua require('telescope.builtin').lsp_document_diagnostics()<cr>

local actions = require('telescope.actions')
local telescopeConfig = require("telescope.config")

-- Clone the default Telescope configuration
local vimgrep_arguments = { unpack(telescopeConfig.values.vimgrep_arguments) }

-- I want to search in hidden/dot files.
table.insert(vimgrep_arguments, "--hidden")
-- I don't want to search in the `.git` directory.
table.insert(vimgrep_arguments, "--glob")
table.insert(vimgrep_arguments, "!**/.git/*")
-- Global remapping
------------------------------
require('telescope').setup {
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
				fuzzy = true,       -- false will only do exact matching
				override_generic_sorter = true, -- override the generic sorter
				override_file_sorter = true, -- override the file sorter
				case_mode = "smart_case", -- or "ignore_case" or "respect_case"
				-- the default case_mode is "smart_case"
			}
		},
	},
	pickers = {
		find_files = {
			-- `hidden = true` will still show the inside of `.git/` as it's not `.gitignore`d.
			find_command = { "rg", "--files", "--hidden", "--glob", "!**/.git/*" },
		},
	},
}

require('telescope').load_extension('fzf')
