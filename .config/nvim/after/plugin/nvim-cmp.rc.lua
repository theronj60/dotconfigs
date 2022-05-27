  -- Setup nvim-cmp.
  local cmp = require'cmp'

  cmp.setup({
    snippet = {
      expand = function(args)
        vim.fn["UltiSnips#Anon"](args.body)
      end,
    },
    mapping = cmp.mapping.preset.insert({
      ['<C-d>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.close(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }),
    }),
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'ultisnips' },
    }, {
      { name = 'buffer' },
    })
  })
-- { 'clangd', 'jedi_language_server', 'intelephense', 'tsserver', 'html', 'svelte', 'vuels', 'lua', 'vim', 'tailwindcss' }

  -- Setup for nvim_lsp
	--   local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
	--   local nvim_lsp = require('lspconfig')
	--   local servers = {vim.fn.stdpath "data", "lsp_servers"}
	-- for _, lsp in ipairs(servers) do
	-- nvim_lsp[lsp].setup {
	-- 	on_attach = nvim_lsp.on_attach,
	-- 	capabilities = capabilities
	--     }
	-- end

