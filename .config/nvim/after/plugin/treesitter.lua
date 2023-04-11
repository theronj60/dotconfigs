require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
  },
  indent = {
    enable = true,
  },
  sync_install = false,
  auto_install = true,
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
  additional_vim_regex_highlighting = false,
}

vim.treesitter.language.register('html', 'blade')  -- the someft filetype will use the python parser and queries.
-- local ft_to_parser = require"nvim-treesitter.parsers".filetype_to_parsername
-- ft_to_parser.blade = "html"
