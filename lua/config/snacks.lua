return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	---@type snacks.Config
	opts = {
		bigfile = { enabled = true },
		dashboard = { enabled = true },
		explorer = { enabled = true },
		indent = {
			enabled = true,
			scope = {
				enabled = true,
				underline = false,
			},
			chunk = {
				enabled = false,
				char = {
					corner_top = "╭",
					corner_bottom = "╰",
					vertical = "│",
					arrow = "╼",
				},
			},
		},
		input = { enabled = true },
		picker = {
			enabled = true,
			hidden = true,
			ignored = true,
		},
		image = {
			enabled = true,
			formats = {
				"png",
				"jpg",
				"jpeg",
				"gif",
				"bmp",
				"webp",
				"tiff",
				"heic",
				"avif",
				"mp4",
				"mov",
				"avi",
				"mkv",
				"webm",
				"pdf",
				"icns",
			},
			doc = {
				enabled = true,
				inline = true,
				float = true,
				max_width = 80,
				max_height = 80,
			},
		},
		notifier = {
			timeout = 3000,
			width = { min = 40, max = 0.4 },
			height = { min = 1, max = 0.6 },
			margin = { top = 0, right = 1, bottom = 0 },
			padding = true,
			gap = 0,
			sort = { "level", "added" },
			level = vim.log.levels.TRACE,
			icons = {
				error = " ",
				warn = " ",
				info = " ",
				debug = " ",
				trace = " ",
			},
			keep = function(notif)
				return vim.fn.getcmdpos() > 0
			end,
			---@type snacks.notifier.style
			style = "fancy",
			top_down = true,
			date_format = "%R",
			---@type string|boolean
			more_format = " ↓ %d lines ",
			refresh = 50,
		},
		quickfile = { enabled = true },
		scope = { enabled = true },
		scroll = { enabled = false },
		statuscolumn = { enabled = true },
		words = { enabled = true },
		terminal = {
			enabled = true,
			win = { style = "terminal" },
		},
		styles = {
			terminal = {
				keys = {
					term_normal = {
						"<c-q>",
						function()
							Snacks.terminal.toggle()
						end,
						mode = "t",
					},
				},
			},

			notification = {
				border = true,
				zindex = 100,
				ft = "markdown",
				wo = {
					winblend = 0,
					wrap = true,
					conceallevel = 2,
					colorcolumn = "",
				},
				bo = { filetype = "snacks_notif" },
			},

			notification_history = {
				border = true,
				zindex = 100,
				minimal = false,
				title = " Notifications ",
				title_pos = "center",
				ft = "markdown",
				bo = { filetype = "snacks_notif_history", modifiable = false },
				wo = { winhighlight = "Normal:SnacksNotifierHistory" },
				keys = { q = "close" },
			},
		},
		gitbrowse = {
			enabled = true,
			notify = false,
		},
	},
}
