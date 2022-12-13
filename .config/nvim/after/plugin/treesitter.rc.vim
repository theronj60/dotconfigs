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
	"astro",
    "tsx",
	"cpp",
    "toml",
	"dockerfile",
    "php",
	"gdscript",
	"prisma",
	"python",
    "json",
    "yaml",
    "html",
    "scss",
	"vue",
	"css",
	"rust",
	"javascript",
	"typescript",
	"lua",
	"vim",
	"go"
  },
}

local ft_to_parser = require"nvim-treesitter.parsers".filetype_to_parsername
ft_to_parser.blade = "html" 

EOF
