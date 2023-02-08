-------------Key-Bindings--------------"
--Vim exit modes
vim.keymap.set("i", "jk", "<Esc>")
--switched movement for new keyboard
vim.keymap.set("n", "t", "l")
vim.keymap.set("v", "t", "l")
-- Vim Buffers
vim.keymap.set("n", "<Space>.", vim.cmd.BufferLineCycleNext)
vim.keymap.set("n", "<Space>,", vim.cmd.BufferLineCyclePrev)
vim.keymap.set("n", "<Space><<", vim.cmd.BufferLineMovePrev)
vim.keymap.set("n", "<Space>>>", vim.cmd.BufferLineMoveNext)
-- Close selected buffer
vim.keymap.set("n", "<Space>db", vim.cmd.bd)
-- Vim Windows
vim.keymap.set("n", "<Space>C", ":close<CR>")
vim.keymap.set("n", "<leader>ss", ":split<return><C-w>w")
vim.keymap.set("n", "<leader>sv", ":vsplit<return><C-w>w")
vim.keymap.set("n", "<leader><Space>", "<C-w>w")
vim.keymap.set("n", "<C-w>e", ":vertical resize +10<CR>")
vim.keymap.set("n", "<C-w>s", ":vertical resize -10<CR>")
-- Clear highlight search
vim.keymap.set("n", "<leader>cl", ":let @/ = ''<CR>")
-- NvimTree mappings
vim.keymap.set("n", "<F1>", vim.cmd.NvimTreeToggle)
vim.keymap.set("n", "<leader>e", vim.cmd.NvimTreeRefresh)

---------movements---------
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-u>", "<C-u>zzzv")
vim.keymap.set("n", "<C-d>", "<C-d>zzzv")

---------text---------
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("i", "<C-j>", "<esc>:m .+1<CR>==")
vim.keymap.set("i", "<C-k>", "<esc>:m .-2<CR>==")
vim.keymap.set("n", "<leader>j", ":m.+1<CR>==")
vim.keymap.set("n", "<leader>k", ":m.-2<CR>==")
-- Clipboard, c = copy, p = paste
vim.keymap.set("v", "<leader>c", "*y<CR>")
vim.keymap.set("n", "<leader>v", "*p<CR>")
-- New line up/down
vim.keymap.set("n", "<leader>o", "o<Esc>")
vim.keymap.set("n", "<leader>O", "O<Esc>")
