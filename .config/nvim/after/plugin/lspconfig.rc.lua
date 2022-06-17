-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap=true, silent=true }
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap=true, silent=true, buffer=bufnr }
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, bufopts)
  vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
  vim.keymap.set('n', '<space>f', vim.lsp.buf.formatting, bufopts)
end

local lsp_flags = {
  -- This is the default in Nvim 0.7+
  debounce_text_changes = 150,
}
-- require('lspconfig')['pyright'].setup{
--     on_attach = on_attach,
--     flags = lsp_flags,
-- }

local nvim_lsp = require('lspconfig')
local lsp_installer = require("nvim-lsp-installer")
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

lsp_installer.setup{}

nvim_lsp.rust_analyzer.setup({
	on_attach=on_attach,
	capabilities = capabilities,
	flag = lsp_flags,
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


nvim_lsp.emmet_ls.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	filetypes = { "html", "vue", "blade", "css", "less", "postcss", "sass", "scss", "typescriptreact", "javascriptreact" },
})

nvim_lsp.html.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	filetypes = { "html", "blade" }
})

nvim_lsp.volar.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	filetypes = { "typescript", "javascript", "vue", "json" }
})

nvim_lsp.tailwindcss.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	filetypes = { "blade", "html", "php", "css", "less", "postcss", "sass", "scss", "javascript", "javascriptreact", "typescript", "typescriptreact", "vue" }
})

nvim_lsp.intelephense.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	filetypes = { "php", "phtml", "blade" }
})

nvim_lsp.gopls.setup{
	on_attach = on_attach,
	capabilities = capabilities,
}

nvim_lsp.bashls.setup{
	on_attach = on_attach,
	capabilities = capabilities,
}

nvim_lsp.vimls.setup{
	on_attach = on_attach,
	capabilities = capabilities,
}

nvim_lsp.clangd.setup{
	on_attach = on_attach,
	capabilities = capabilities,
}

nvim_lsp.tsserver.setup{
	on_attach = on_attach,
	capabilities = capabilities,
}

nvim_lsp.sumneko_lua.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
	Lua = {
	  runtime = {
		-- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
		version = 'LuaJIT',
	  },
	  diagnostics = {
		-- Get the language server to recognize the `vim` global
		globals = {'vim'},
	  },
	  workspace = {
		-- Make the server aware of Neovim runtime files
		library = vim.api.nvim_get_runtime_file("", true),
	  },
	  -- Do not send telemetry data containing a randomized but unique identifier
	  telemetry = {
		enable = false,
	  },
	},
  },
}

