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
		notifier = { enabled = true },
		quickfile = { enabled = true },
		scope = { enabled = true },
		scroll = { enabled = true },
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
						mode = "t"
					}
				}
			}
		},
		gitbrowse = {
			enabled = true,
			notify = false,
		},
	},
}
