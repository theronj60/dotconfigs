" Keybindings

nnoremap <silent> <space>H <cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>
nnoremap <silent> <space>a <cmd>lua require('harpoon.mark').add_file()<cr>

lua << EOF
require('harpoon').setup({
    global_settings = {
        save_on_toggle = false,
        save_on_change = true,
        enter_on_sendcmd = false,
    },
    -- ... your other configs ...
})

EOF
