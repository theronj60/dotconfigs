vim.keymap.set('n', '<Leader>t', ':FloatermToggle<CR>')
vim.keymap.set('t', '<Leader>t', '<C-\\><C-n>:FloatermToggle<CR>')

vim.g.floaterm_gitcommit = 'floaterm'
vim.g.floaterm_autoinsert = 1
vim.g.floaterm_width = 0.8
vim.g.floaterm_height = 0.8
vim.g.floaterm_wintitle = 0

vim.cmd([[
  highlight link Floaterm CursorLine
  highlight link FloatermBorder CursorLine
]])
