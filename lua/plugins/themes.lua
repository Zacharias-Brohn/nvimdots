return {
	{
		"notken12/base46-colors",
	},
	{
		"nvim-lualine/lualine.nvim",
		event = "VeryLazy",
		config = function ()
			if vim.env.TMUX then
				vim.api.nvim_create_autocmd({ "FocusGained", "ColorScheme", "VimEnter" }, {
					callback = function()
						vim.defer_fn( function()
							vim.opt.laststatus = 0
						end, 100)
					end,
				})
				vim.o.laststatus = 0
			end
			require("config.theme.lualine")
		end,
	},
	{
		"catgoose/nvim-colorizer.lua",
		config = function()
			require("config.theme.colorizer")
		end,
	},
    {
		"olimorris/onedarkpro.nvim",
        enabled = false,
		priority = 1000,
		config = function()
			require("config.theme.onedarkpro-light")
		end,
	},
}
