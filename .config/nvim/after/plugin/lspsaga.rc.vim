if !exists('g:loaded_lspsaga') | finish | endif

lua << EOF
local saga = require 'lspsaga'

saga.init_lsp_saga {
	error_sign = '',
	warn_sign = '',
	hint_sign = '',
	infor_sign = '',
	border_style = "round",
}

EOF

nnoremap <silent><space><space> <Cmd>Lspsaga diagnostic_jump_next<CR>
nnoremap <silent><space>dp <Cmd>Lspsaga diagnostic_jump_prev<CR>
nnoremap <silent><space>e <Cmd>Lspsaga show_line_diagnostics<CR>
nnoremap <silent>K <Cmd>Lspsaga hover_doc<CR>
nnoremap <silent>gh <Cmd>Lspsaga lsp_finder<CR>
nnoremap <silent>gj <Cmd>Lspsaga signature_help<CR>
nnoremap <silent><leader>t <Cmd>Lspsaga open_floaterm<CR>
tnoremap <silent><A-d> <Cmd>Lspsaga close_floaterm<CR>
nnoremap <silent><space>ca <Cmd>Lspsaga code_action<CR>

