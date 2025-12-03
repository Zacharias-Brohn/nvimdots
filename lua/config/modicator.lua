require("modicator").setup({
	show_warnings = true,
	highlights = {
		defaults = {
			bold = false,
			italic = false,
		},
		use_cursorline_background = true,
	},
	integration = {
		lualine = {
			enabled = true,
			mode_section = nil,
			highlight = 'bg',
		}
	}
})
