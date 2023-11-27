require 'nvim-treesitter.configs'.setup {
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

local parser_config = require "nvim-treesitter.parsers".get_parser_configs()

parser_config.blade = {
	install_info = {
		url = "https://github.com/EmranMR/tree-sitter-blade",
		files = { "src/parser.c" },
		branch = "main",
	},
	filetype = "blade"
}

vim.g.skip_ts_context_commentstring_module = true
require('ts_context_commentstring').setup {}
-- local ft_to_parser = require "nvim-treesitter.parsers".filetype_to_parsername
-- ft_to_parser.php = "blade"

