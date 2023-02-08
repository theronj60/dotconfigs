local lsp = require("lsp-zero")

lsp.preset("recommended")

lsp.ensure_installed({
	'tsserver',
	'sumneko_lua',
	'rust_analyzer',
})

-- Fix Undefined global 'vim'
lsp.configure('sumneko_lua', {
	settings = {
		Lua = {
			diagnostics = {
				globals = { 'vim' }
			}
		}
	}
})


local cmp = require('cmp')
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = lsp.defaults.cmp_mappings({
		['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
		['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
		['<C-y>'] = cmp.mapping.confirm({ select = true }),
		["<C-Space>"] = cmp.mapping.complete(),
	})

cmp_mappings['<Tab>'] = nil
cmp_mappings['<S-Tab>'] = nil

lsp.setup_nvim_cmp({
	mapping = cmp_mappings
})

lsp.set_preferences({
	suggest_lsp_servers = false,
	sign_icons = {
		error = 'E',
		warn = 'W',
		hint = 'H',
		info = 'I'
	}
})

lsp.on_attach(function(client, bufnr)
	local opts = { buffer = bufnr, remap = false }

	vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
	vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
	vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
	vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
	vim.keymap.set("n", "<space><space>", function() vim.diagnostic.goto_next() end, opts)
	vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
	vim.keymap.set("n", "<space>ca", function() vim.lsp.buf.code_action() end, opts)
	vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
	-- vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
	vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
	vim.keymap.set("n", "<space>f", function() vim.lsp.buf.format() end, opts)
end)

lsp.setup()

vim.diagnostic.config({
	virtual_text = true
})


-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
--local opts = { noremap = true, silent = true }
-- vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
--vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
--vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
--vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
--local on_attach = function(client, bufnr)
---- Enable completion triggered by <c-x><c-o>
--vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
--
---- Mappings.
---- See `:help vim.lsp.*` for documentation on any of the below functions
--local bufopts = { noremap = true, silent = true, buffer = bufnr }
--vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
--vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
---- vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
--vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
--vim.keymap.set('n', '<C-h>', vim.lsp.buf.signature_help, bufopts)
--vim.keymap.set('i', '<C-h>', vim.lsp.buf.signature_help, bufopts)
--vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
--vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
--vim.keymap.set('n', '<space>wl', function()
--	print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
--end, bufopts)
--vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
--vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
--vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
--vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
--vim.keymap.set('n', '<space>f', vim.lsp.buf.format, bufopts)
--end

--Local lsp_flags = {
--	-- This is the default in Nvim 0.7+
--	debounce_text_changes = 150,
--}
--
--Require("mason").setup()
--Require("mason-lspconfig").setup()
--
--Local nvim_lsp = require('lspconfig')
--Local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())
--Local util = require 'lspconfig.util'
--
--Capabilities.textDocument.completion.completionItem.snippetSupport = true
--Nvim_lsp.rust_analyzer.setup({
--	on_attach = on_attach,
--	capabilities = capabilities,
--	flag = lsp_flags,
--	settings = {
--		["rust-analyzer"] = {
--			assist = {
--				importGranularity = "module",
--				importPrefix = "by_self",
--			},
--			cargo = {
--				loadOutDirsFromCheck = true
--			},
--			procMacro = {
--				enable = true
--			},
--		}
--	}
--})
--
--Nvim_lsp.emmet_ls.setup({
--	on_attach = on_attach,
--	capabilities = capabilities,
--	filetypes = { "html", "vue", "blade", "css", "less", "postcss", "sass", "scss", "typescriptreact", "javascriptreact" },
--})
--
--Nvim_lsp.html.setup({
--	on_attach = on_attach,
--	capabilities = capabilities,
--	filetypes = { "html", "blade" }
--})
--
--Nvim_lsp.volar.setup {
--	on_attach = on_attach,
--	capabilities = capabilities,
--	init_options = {
--		typescript = {
--			tsdk = '../.yarn/sdks/typescript/lib/'
--		}
--	},
--	filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue', 'json' }
--}
--
---- nvim_lsp.tsserver.setup({
---- 	on_attach = on_attach,
---- 	capabilities = capabilities,
---- 	{ "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx" }
---- })
--
--Nvim_lsp.tailwindcss.setup({
--	on_attach = on_attach,
--	capabilities = capabilities,
--	filetypes = { "blade", "html", "php", "css", "less", "postcss", "sass", "scss", "astro", "javascript", "javascriptreact",
--		"typescript", "typescriptreact", "vue" }
--})
--
--Nvim_lsp.intelephense.setup({
--	on_attach = on_attach,
--	capabilities = capabilities,
--	filetypes = { "php", "phtml", "blade" }
--})
--
--Nvim_lsp.gdscript.setup {
--	on_attach = on_attach,
--	capabilities = capabilities,
--	cmd = { "nc", "localhost", "6008" },
--	filetypes = { "gd", "gdscript", "gdscript3" },
--	root_dir = util.root_pattern("project.godot", ".git")
--}
--
--Nvim_lsp.astro.setup {
--	on_attach = on_attach,
--	capabilities = capabilities,
--	init_options = {
--		typescript = {
--			serverPath = "/Users/theronjoe/.local/share/nvim/lsp_servers/vscode-langservers-extracted/node_modules/typescript/lib/tsserverlibrary.js",
--		}
--	}
--}
--
--Nvim_lsp.gopls.setup {
--	on_attach = on_attach,
--	capabilities = capabilities,
--}
--
--Nvim_lsp.bashls.setup {
--	on_attach = on_attach,
--	capabilities = capabilities,
--}
--
--Nvim_lsp.vimls.setup {
--	on_attach = on_attach,
--	capabilities = capabilities,
--}
--
--Nvim_lsp.clangd.setup {
--	on_attach = on_attach,
--	capabilities = capabilities,
--}
--
--Nvim_lsp.jedi_language_server.setup {
--	on_attach = on_attach,
--	capabilities = capabilities,
--}
--
--Nvim_lsp.yamlls.setup {
--	on_attach = on_attach,
--	capabilities = capabilities,
--}
--
--Nvim_lsp.jsonls.setup {
--	on_attach = on_attach,
--	capabilities = capabilities,
--}
--
--Nvim_lsp.prismals.setup {
--	on_attach = on_attach,
--	capabilities = capabilities,
--}
--
--Nvim_lsp.sumneko_lua.setup {
--	on_attach = on_attach,
--	capabilities = capabilities,
--	settings = {
--		Lua = {
--			runtime = {
--				-- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
--				version = 'LuaJIT',
--			},
--			diagnostics = {
--				-- Get the language server to recognize the `vim` global
--				globals = { 'vim' },
--			},
--			workspace = {
--				-- Make the server aware of Neovim runtime files
--				library = vim.api.nvim_get_runtime_file("", true),
--			},
--			-- Do not send telemetry data containing a randomized but unique identifier
--			telemetry = {
--				enable = false,
--			},
--		},
--	},
--}
