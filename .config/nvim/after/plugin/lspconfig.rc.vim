if !exists('g:lspconfig')
	finish
endif

lua << EOF
vim.lsp.set_log_level("debug")
EOF

lua << EOF
local nvim_lsp = require('lspconfig')
local protocol = require'vim.lsp.protocol'
-- local util = require 'lspconfig/util'

-- Use an on_attach function to only map the following keys 
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
	local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
	local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

	--Enable completion triggered by <c-x><c-o>
	buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

	-- Mappings.
	local opts = { noremap=true, silent=true }

	-- See `:help vim.lsp.*` for documentation on any of the below functions
	--buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
	--buf_set_keymap('i', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
	buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
	buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
	buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
	buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
	--buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
	buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
	buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
	-- buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
	buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
	buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
	buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)

	-- formatting (auto)
	--if client.resolved_capabilities.document_formatting then
	--	vim.api.nvim_command [[augroup Format]]
	--	vim.api.nvim_command [[autocmd! * <buffer>]]
	--	vim.api.nvim_command [[autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_seq_sync()]]
	--	vim.api.nvim_command [[augroup END]]
	--end
	end	

	local lsp_installer = require("nvim-lsp-installer")

	lsp_installer.setup{}

	-- do i need this anymore?
	-- nvim_lsp.diagnosticls.setup {
	--   on_attach = on_attach,
	--   filetypes = { 'javascript', 'javascriptreact', 'json', 'vue', 'blade', 'typescript', 'typescriptreact', 'css', 'less', 'scss', 'pandoc' },
	--   init_options = {
	-- 		linters = {
	-- 		  eslint = {
	-- 			command = 'eslint_d',
	-- 			rootPatterns = { '.git' },
	-- 			debounce = 100,
	-- 			args = { '--stdin', '--stdin-filename', '%filepath', '--format', 'json' },
	-- 			sourceName = 'eslint_d',
	-- 			parseJson = {
	-- 			  errorsRoot = '[0].messages',
	-- 			  line = 'line',
	-- 			  column = 'column',
	-- 			  endLine = 'endLine',
	-- 			  endColumn = 'endColumn',
	-- 			  message = '[eslint] ${message} [${ruleId}]',
	-- 			  security = 'severity'
	-- 			},
	-- 			securities = {
	-- 			  [2] = 'error',
	-- 			  [1] = 'warning'
	-- 			}
	-- 		  },
	-- 		},
	-- 		filetypes = {
	-- 		  vue = 'eslint',
	-- 		  javascript = 'eslint',
	-- 		  javascriptreact = 'eslint',
	-- 		  typescript = 'eslint',
	-- 		  typescriptreact = 'eslint',
	-- 		},
	-- 		formatters = {
	-- 		  eslint_d = {
	-- 			command = 'eslint_d',
	-- 			args = { '--stdin', '--stdin-filename', '%filename', '--fix-to-stdout' },
	-- 			rootPatterns = { '.git' },
	-- 		  },
	-- 		  prettier = {
	-- 			command = 'prettier',
	-- 			args = { '--stdin-filepath', '%filename' }
	-- 		  }
	-- 		},
	-- 		formatFiletypes = {
	-- 		  css = 'prettier',
	-- 		  javascript = 'eslint_d',
	-- 		  javascriptreact = 'eslint_d',
	-- 		  vue = 'eslind_d',
	-- 		  json = 'prettier',
	-- 		  scss = 'prettier',
	-- 		  less = 'prettier',
	-- 		  typescript = 'eslint_d',
	-- 		  typescriptreact = 'eslint_d',
	-- 		  json = 'prettier',
	-- 		  markdown = 'prettier',
	-- 		}
	-- 	  }
	-- }
	
	nvim_lsp.rust_analyzer.setup({
		on_attach=on_attach,
		settings = {
			["rust-analyzer"] = {
				assist = {
					importGranularity = "module",
					importPrefix = "by_self",
				},
				cargo = {
					loadOutDirsFromCheck = true
				},
				procMacro = {
					enable = true
				},
			}
		}
	})

	local capabilities = vim.lsp.protocol.make_client_capabilities()
	capabilities.textDocument.completion.completionItem.snippetSupport = true

	nvim_lsp.emmet_ls.setup({
		-- on_attach = on_attach,
		capabilities = capabilities,
		filetypes = { "html", "vue", "blade", "css", "less", "postcss", "sass", "scss", "typescriptreact", "javascriptreact"},
	})

	nvim_lsp.volar.setup({
		capabilities = capabilities,
		filetypes = { "typescript", "javascript", "vue", "json"}
	})

	nvim_lsp.tailwindcss.setup({
		capabilities = capabilities,
		filetypes = { "blade", "html", "php", "css", "less", "postcss", "sass", "scss", "javascript", "javascriptreact", "typescript", "typescriptreact", "vue"}
	})

	nvim_lsp.intelephense.setup({
		capabilities = capabilities,
		filetypes = { "php", "phtml", "blade.php"},
	})

	nvim_lsp.gopls.setup{}

	nvim_lsp.bashls.setup{}

	nvim_lsp.vimls.setup{}

	nvim_lsp.clangd.setup{}

	nvim_lsp.tsserver.setup{}

EOF
