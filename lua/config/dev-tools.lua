return {
	"yarospace/dev-tools.nvim",
	opts = {
		actions = {},

		filetypes = {
			include = {},
			exclude = {},
		},

		builtin_actions = {
			include = {},
			exclude = {},
		},

		action_opts = {
			{
				group = "Debuggins",
				name = "Log vars under cursor",
				opts = {
					keymap = {
						global = "<leader>dl",
						picker = "<M-l>",
						hide = true,
					}
				}
			}
		}
	},

	ui = {
		override = true,
		group_actions = true,
	}
}
