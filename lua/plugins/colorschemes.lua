return {
	{
		"olimorris/onedarkpro.nvim",
		priority = 1000,
		config = function()
			require "config.themelight"
		end,
	},
	{
		"notken12/base46-colors",
	},
	{
		"loctvl842/monokai-pro.nvim",
		config = function()
			require "config.monokaipro"
		end,
	},
	{
		"catppuccin/nvim",
		name = "catppuccin",
		-- config = function()
		-- 	require("config.catppuccin")
		-- end,
	},
	{
		"rebelot/kanagawa.nvim",
		-- config = function()
		-- 	require("config.kanagawa")
		-- end,
	},
	{
		"sainnhe/edge",
		lazy = false,
		priority = 1000,
		config = function()
			vim.g.edge_enable_italic = 1
			vim.g.edge_style = "default"
			vim.g.edge_menu_selection_background = "purple"
		end,
	},
	{
		"projekt0n/github-nvim-theme",
		lazy = false,
		priority = 1000,
		config = function()
			require "config.githubtheme"
		end,
	},
	{
		"alexmozaidze/palenight.nvim",
	},
	{
		"Yazeed1s/minimal.nvim",
		init = function()
			vim.g.minimal_italic_comments = true
			vim.g.minimal_italic_keywords = true
		end,
	},
}
