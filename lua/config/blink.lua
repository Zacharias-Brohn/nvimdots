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
	},
}

local opts = {
	"saghen/blink.cmp",
	dependencies = {
		"rafamadriz/friendly-snippets",
		{
			"fang2hou/blink-copilot",
			config = function()
				require "config.blink-copilot"
			end,
		},
	},

	version = "1.*",

	opts = {
		keymap = {
			["<Tab>"] = {
				function(cmp)
					if cmp.is_visible() then
						return cmp.select_next()
					end

					if cmp.snippet_active() then
						return cmp.snippet_forward()
					end
				end,
				"fallback",
			},
			["<S-Tab>"] = {
				function(cmp)
					if cmp.is_visible() then
						return cmp.select_prev()
					end

					if cmp.snippet_active() then
						return cmp.snippet_backward()
					end
				end,
				"fallback",
			},
			["<CR>"] = { "accept", "fallback" },
			["Up"] = {},
			["Down"] = {},
		},

		appearance = {
			nerd_font_variant = "mono",
		},

		cmdline = {
			completion = {
				menu = { auto_show = true },
				list = { selection = { preselect = false } },
			},

			keymap = {
				["<Tab>"] = {
					function(cmp)
						if cmp.is_visible() then
							return cmp.select_next()
						end
					end,
					"fallback",
				},
				["<S-Tab>"] = {
					function(cmp)
						if cmp.is_visible() then
							return cmp.select_prev()
						end
					end,
					"fallback",
				},
				["<CR>"] = { "accept", "fallback" },
				["Up"] = {},
				["Down"] = {},
			},
		},

		completion = {
			documentation = { auto_show = true, auto_show_delay_ms = 50 },
			keyword = { range = "full" },
			accept = { auto_brackets = { enabled = true } },
			ghost_text = { enabled = true },
			list = {
				selection = {
					-- preselect = false,
					auto_insert = false,
				},
			},

			menu = {
				scrollbar = false,
				border = "single",
				draw = {
					padding = 1,
					columns = {
						{ "kind_icon" },
						{ "label", "label_description", gap = 1 },
						{ "kind" },
					},
					components = M.components,
				},
			},
		},

		signature = { enabled = true },

		sources = {
			default = { "lsp", "path", "snippets", "buffer", "copilot" },
			providers = {
				lsp = {
					score_offset = 50,
				},

				path = {
					opts = {
						get_cwd = function()
							return vim.fn.getcwd()
						end,
					},
				},

				buffer = {
					score_offset = -10,
				},

				snippets = {
					score_offset = 0,
				},

				copilot = {
					name = "copilot",
					module = "blink-copilot",
					score_offset = 100,
					async = true,
				},
			},
		},

		snippets = {
			preset = "default",
		},

		fuzzy = { implementation = "prefer_rust_with_warning" },
	},
	opts_extend = { "sources.default" },
}

return opts
