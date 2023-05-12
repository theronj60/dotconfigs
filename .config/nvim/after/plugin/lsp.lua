local lsp = require("lsp-zero")

lsp.preset({
	name = 'minimal',
	set_lsp_keymaps = true,
	manage_nvim_cmp = true,
	suggest_lsp_servers = true,
})

lsp.ensure_installed({
	'volar',
	'rust_analyzer',
})

local util = require('lspconfig.util')

lsp.configure('bashls', {
	filetypes = { "sh", "zsh" }
})

-- Fix Undefined global 'vim'
lsp.configure('lua_ls', {
	settings = {
		Lua = {
			diagnostics = {
				globals = { 'vim' }
			}
		}
	}
})

lsp.configure('emmet_ls', {
	filetypes = { "html", "vue", "php", "blade", "css", "less", "postcss", "sass", "scss", "typescriptreact",
		"javascriptreact" },
})

lsp.configure('html', {
	filetypes = { "html", "php", "blade" }
})

lsp.configure('intelephense', {
	root_dir = util.root_pattern("composer.json", ".git") -- removed git for wordpress dev, , "wp-config.php"
})

lsp.configure('pylsp', {
	settings = {
		pylsp = {
			plugins = {
				pycodestyle = {
					ignore = { 'E302' },
					maxLineLength = 100
				}
			}
		}
	}
})

lsp.configure('volar', {
	filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue", "json" },
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
	sign_icons = {
		error = '',
		warn = '',
		hint = '',
		info = ''
	}
})

-- lsp.on_attach(function(client, bufnr)
vim.api.nvim_create_autocmd('LspAttach', {
	group = vim.api.nvim_create_augroup('UserLspConfig', {}),
	callback = function(ev)
		-- Enable completion triggered by <c-x><c-o>
		vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'
		local opts = { buffer = ev.buf, remap = false }

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
	end
})

lsp.setup()

vim.diagnostic.config({
	virtual_text = true
})
