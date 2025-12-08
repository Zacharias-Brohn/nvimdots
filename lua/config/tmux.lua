require("tmux").setup({
	copy_sync = {
		enable = true,
		redirect_to_clipboard = true,
		sync_clipboard = false,
		sync_registers = true,
	},
	navigation = {
		cycle_navigation = true,
		enable_default_keybindings = false,
	},
	resize = {
		enable_default_keybindings = false,
		resize_step_x = 5,
		resize_step_y = 5,
	},
	swap = {
		cycle_navigation = false,
		enable_default_keybindings = false,
	}
})
