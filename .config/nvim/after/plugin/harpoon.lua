-- Keybindings
local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

vim.keymap.set("n", "<space>h", ui.toggle_quick_menu)
vim.keymap.set("n", "<space>a", mark.add_file)

-- nnoremap <silent> <space>h <cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>
-- nnoremap <silent> <space>a <cmd>lua require('harpoon.mark').add_file()<cr>
-- nnoremap <silent> <space>1 <cmd>lua require('harpoon.ui').nav_file(1,2,3)<cr>
-- nnoremap <silent> <space>2 <cmd>lua require('harpoon.ui').nav_file(2)<cr>
-- nnoremap <silent> <space>3 <cmd>lua require('harpoon.ui').nav_file(3)<cr>
-- nnoremap <silent> <space>4 <cmd>lua require('harpoon.ui').nav_file(4)<cr>
-- nnoremap <silent> <space>5 <cmd>lua require('harpoon.ui').nav_file(5)<cr>
-- :lua require("harpoon.ui").nav_file(3) -- This will navigate to file 3

require('harpoon').setup({
	global_settings = {
		save_on_toggle = false,
		save_on_change = true,
		enter_on_sendcmd = false,
	},
	-- ... your other configs ...
})
