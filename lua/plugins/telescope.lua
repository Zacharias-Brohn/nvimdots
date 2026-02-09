return {
	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		config = function()
			require("config.telescope")
		end,
	},
	{
		"propet/colorscheme-persist.nvim",
		enable = false,
		dependencies = {
			"nvim-telescope/telescope.nvim",
		},
		lazy = false,
		config = true,
		keys = {
			{
				"<leader>sp",
				function()
					require("colorscheme-persist").picker()
				end,
				mode = "n",
			},
		},
		opts = function()  -- ✅ Changed to function
			return {
				picker_opts = require("telescope.themes").get_dropdown({
					enable_preview = true,
				}),
			}
		end,
	},
}
