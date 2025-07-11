local lsp = require("lsp-zero")

lsp.preset({
	name = 'minimal',
	set_lsp_keymaps = true,
	manage_nvim_cmp = true,
	suggest_lsp_servers = true,
})

lsp.ensure_installed({
	'volar',
	'gopls'
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

local on_attach = function(_, bufnr)
	local function buf_set_option(...)
		vim.api.nvim_buf_set_option(bufnr, ...)
	end

	buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

	-- vim.api.nvim_create_autocmd("InsertLeave", {
	-- 	command = "w",
	-- 	buffer = bufnr,
	-- 	nested = true
	-- })

	-- Mappings.
	local opts = { buffer = bufnr, noremap = true, silent = true }

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

vim.lsp.set_log_level('trace')
require('vim.lsp.log').set_format_func(vim.inspect)

local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())

local util = require('lspconfig.util')
local lspconfig = require('lspconfig')

lspconfig['rust_analyzer'].setup({
	on_attach = on_attach,
	capabilities = capabilities,
	settings = {
		["rust-analyzer"] = {
			imports = {
				granularity = {
					group = "module",
				},
				prefix = "self",
			},
			cargo = {
				buildScripts = {
					enable = true,
				},
			},
			procMacro = {
				enable = true
			},
			checkOnSave = {
				command = "clippy" -- default is check
			},
		}
	},
	diagnostics = {
		enable = true,
	},
	cmd = {
		"rustup", "run", "stable", "rust-analyzer"
	},
	autostart = true,
	root_dir = util.root_pattern("Cargo.toml", "rust-project.json")
})

lsp.configure('bashls', {
	on_attach = on_attach,
	filetypes = { "sh", "zsh" }
})

lsp.configure('gopls', {
	on_attach = on_attach,
	settings = {
		gopls = {
			completeUnimported = true,
			analyses = {
				unusedparams = true,
			}
		}
	}
})

lsp.configure('lua_ls', {
	on_attach = on_attach,
	capabilities = capabilities,
	settings = {
		Lua = {
			diagnostics = {
				globals = { 'vim' }
			}
		}
	}
})

lsp.configure('intelephense', {
	on_attach = on_attach,
	capabilities = capabilities,
	filetypes = { "php", "blade" },
	root_dir = util.root_pattern("composer.json", ".git")
})

lsp.configure('emmet_ls', {
	on_attach = on_attach,
	capabilities = capabilities,
	filetypes = { "html", "vue", "php", "blade", "typescriptreact",
		"javascriptreact", "astro" },
})

lsp.configure('html', {
	on_attach = on_attach,
	capabilities = capabilities,
	filetypes = { "html", "php", "blade", "typescriptreact", "astro" }
})

lsp.configure('pylsp', {
	on_attach = on_attach,
	capabilities = capabilities,
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

lsp.configure('clangd', {
	on_attach = on_attach,
	capabilities = capabilities,
})

-- If you are using mason.nvim, you can get the ts_plugin_path like this
local mason_registry = require('mason-registry')
local vue_language_server_path = mason_registry.get_package('vue-language-server'):get_install_path() .. '/node_modules/@vue/language-server'

-- local vue_language_server_path = '/path/to/@vue/language-server'

-- local lspconfig = require('lspconfig')

lsp.configure('ts_ls', {
	on_attach = on_attach,
	capabilities = capabilities,
  init_options = {
    plugins = {
      {
        name = '@vue/typescript-plugin',
        location = vue_language_server_path,
        languages = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue' },
      },
    },
  },
  filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue' },
})

-- No need to set `hybridMode` to `true` as it's the default value
-- lspconfig.volar.setup {}

lsp.configure('volar', {
	on_attach = on_attach,
	capabilities = capabilities,
})

lsp.configure('tailwindcss', {
	on_attach = on_attach,
	capabilities = capabilities,
	filetypes = { "html", "astro", "php", "blade", "vue", "typescriptreact" }
})

-- lsp.configure('astro', {
-- 	on_attach = on_attach,
-- 	capabilities = capabilities,
-- })

lsp.configure('cssls', {
	on_attach = on_attach,
	capabilities = capabilities,
	settings = {
		css = {
			lint = {
				unknownAtRules = "ignore"
			}
		}
	}
})

lsp.configure('terraformls', {
	on_attach = on_attach,
	capabilities = capabilities,
})

lsp.configure('pylsp', {
	on_attach = on_attach,
	capabilities = capabilities,
})

lsp.configure('svelte', {
	on_attach = on_attach,
	capabilities = capabilities,
})

-- lsp.configure('clojure_lsp', {
-- 	on_attach = on_attach,
-- 	capabilities = capabilities,
-- })

lsp.setup()

vim.diagnostic.config({
	virtual_text = true
})
