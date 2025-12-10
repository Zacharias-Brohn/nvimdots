local M = {}

local icons = require("assets.icons").icons.kinds

local devicons = {
	default_icon = { icon = "󰈚", name = "Default" },
	js = { icon = "󰌞", name = "js" },
	ts = { icon = "󰛦", name = "ts" },
	lock = { icon = "󰌾", name = "lock" },
	["robots.txt"] = { icon = "󰚩", name = "robots" },
}

M.components = {
	kind_icon = {
		text = function(ctx)
			local icon = (icons[ctx.kind] or "󰈚")

			return icon .. " "
		end,
	},

	kind = {
		highlight = function(ctx)
			return ctx.kind
		end,
	}
}

local opts = {
	'saghen/blink.cmp',
	dependencies = { 'rafamadriz/friendly-snippets' },


	version = '1.*',

	opts = {
		keymap = {
			preset = 'enter',
			["<Tab>"] = { "select_next", "fallback" },
			["<S-Tab>"] = { "select_prev", "fallback" },
		},

		appearance = {
			nerd_font_variant = 'mono'
		},

		completion = {
			documentation = { auto_show = true, auto_show_delay_ms = 50 },
			keyword = { range = "full" },
			accept = { auto_brackets = { enabled = false }},
			ghost_text = { enabled = true },
			list = {
				selection = {
					preselect = true,
					auto_insert = false,
				}
			},

			menu = {
				scrollbar = false,
				border = "single",
				draw = {
					padding = 1,
					columns = {{ "kind_icon" }, { "label" }, { "kind" }},
					components = M.components,
				}
			}
		},

		sources = {
			default = { 'lsp', 'path', 'snippets', 'buffer' },
		},

		snippets = {
			preset = 'default',
		},

		fuzzy = { implementation = "prefer_rust_with_warning" }
	},
	opts_extend = { "sources.default" }
}

return opts
