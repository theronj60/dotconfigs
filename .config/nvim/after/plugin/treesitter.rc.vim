if !exists('g:loaded_nvim_treesitter')
  echom "Not loaded treesitter"
  finish
endif

lua <<EOF
require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
  },
  indent = {
    enable = true,
  },
  ensure_installed = {
    "tsx",
	"cpp",
    "toml",
	"dockerfile",
    "php",
	"python",
    "json",
    "yaml",
    "html",
    "scss",
	"vue",
	"css",
	"rust",
	"svelte",
	"typescript",
	"lua",
	"vim",
	"go"
  },
}

local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
parser_config.tsx.used_by = { "javascript", "typescript.tsx" }
parser_config.html.used_by = "blade"
parser_config.php.used_by = "blade"
EOF
