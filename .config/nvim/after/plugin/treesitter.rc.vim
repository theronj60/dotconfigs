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
ft_to_parser.html = "blade" 
ft_to_parser.blade = "php" 
--ft_to_parser.tsx = { "javascript", "typescript.tsx" } 

--local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
--parser_config.tsx.filetype_to_parsername = { "javascript", "typescript.tsx" }
--parser_config.html.filetype_to_parsername = "blade"
--parser_config.html.filetype_to_parsername = "javascript"
--parser_config.php.filetype_to_parsername = "blade"
EOF
