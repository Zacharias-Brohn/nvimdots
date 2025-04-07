require("tmux").setup({
    copy_sync = {
        enable = true,
        redirect_to_clipboard = true,
        sync_clipboard = true,
        sync_registers = true,
    },
    navigation = {
        cycle_navigation = true,
        enable_default_keybindings = false,
    },
    resize = {
        enable_default_keybindings = false,
    },
    swap = {
        cycle_navigation = true,
        enable_default_keybindings = false,
    }
})
