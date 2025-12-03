require("mini.splitjoin").setup({
	mappings = {
		toggle = "gS",
	},

	detect = {
		brackets = { '%b()', '%b{}', '%b[]' },

		separator = '[,;]',
	},
})
