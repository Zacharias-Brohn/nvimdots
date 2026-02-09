return {
	{
		"nvim-mini/mini.nvim",
		version = false,

		modules = function()
			require("config.mini-modules")
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter",
		lazy = false,
		build = ":TSUpdate",
		branch = "main",
		config = function()
			require "config.treesitter"
		end,
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
		"rmagatti/auto-session",
		config = function()
			require("config.autosession")
		end,
	},
	{
		"lambdalisue/vim-suda",
		init = function()
			vim.g.suda_smart_edit = 1
		end,
	},
	{
		"nvim-tree/nvim-web-devicons",
	},
	{
		"akinsho/bufferline.nvim",
		event = "VeryLazy",
		config = function()
			require("config.barbar")
		end,
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
			require("config.lualine")
		end,
	},
	{
		"mawkler/modicator.nvim",
		config = function()
			require("config.modicator")
		end
	},
	{
		"shinchu/lightline-gruvbox.vim",
	},
	{
		"jiaoshijie/undotree",
		config = function()
			require("config.undotree")
		end,
	},
	{
		"hiphish/rainbow-delimiters.nvim",
		enabled = true,
	},
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = function()
			require("config.autopairs")
		end,
	},
	{
		"tpope/vim-fugitive",
	},
	{
		"rcarriga/nvim-notify",
		config = function()
			require "config.notify"
		end,
	},
	{
		"zbirenbaum/copilot.lua",
		lazy = true,
		cmd = "Copilot",
		event = "InsertEnter",
		config = function()
			require "config.copilot"
		end,
	},
	{
		"CopilotC-Nvim/CopilotChat.nvim",
		dependencies = {
			{ "zbirenbaum/copilot.lua" },
			{ "nvim-lua/plenary.nvim", branch = "master" },
		},
		build = "make tiktoken",
		config = function()
			require "config.copilotchat"
		end,
	},
	{
		"mfussenegger/nvim-dap",
		config = function()
			require("config.dapconf")
		end,
	},
	{
		require("config.snacks")
	},
	{
		"notken12/base46-colors",
	},
	{
	    "mason-org/mason-lspconfig.nvim",
	    -- opts = {},
	--     dependencies = {
	--         { "mason-org/mason.nvim", opts = {} },
	--         "neovim/nvim-lspconfig",
	--     },
	},
	{
		"folke/lazydev.nvim",
		ft = "lua",
		opts = function()
			require("config.lazydev")
		end,
	},
	{
		"neovim/nvim-lspconfig",
		enabled = true,
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-cmdline",
			"hrsh7th/nvim-cmp",
			"L3MON4D3/LuaSnip",
			"saadparwaiz1/cmp_luasnip",
			"j-hui/fidget.nvim",
		},
		config = function()
			require("config.lspconfig")
		end,
	},
	{
		"smolck/command-completion.nvim",
		opts = {
			border = nil,
			highlight_selection = true,
			use_matchfuzzy = true,
			tab_completion = true,
		},
	},
	{
		"andweeb/presence.nvim",
	},
	{
		"mfussenegger/nvim-jdtls",
	},
	{
		"catgoose/nvim-colorizer.lua",
		config = function()
			require("config.colorizer")
		end,
	},
	{
		"ziglang/zig.vim",
	},
	{
		"mg979/vim-visual-multi",
		branch = "master",
	},
	{
		"elkowar/yuck.vim",
	},
	{
		"f3fora/nvim-texlabconfig",
		config = function()
			require("config.texlab")
		end,
		build = "go build",
	},
	{
		"lancewilhelm/horizon-extended.nvim",
	},
	{
		"vimpostor/vim-tpipeline",
	},
	{
		"yazeed1s/minimal.nvim",
		config = function()
			vim.g.minimal_italic_comments = true
		end,
	},
	{
		"ThePrimeagen/refactoring.nvim",
		config = function()
			require("config.refactoring")
		end,
	},
	{
		"Yazeed1s/minimal.nvim",
		config = function()
			vim.g.minimal_italic_comments = true
			vim.g.minimal_italic_functions = true
		end,
	},
	{
		"aserowy/tmux.nvim",
		config = function()
			require("config.tmux")
		end,
	},
	{
		"rachartier/tiny-inline-diagnostic.nvim",
		config = function ()
			require("config.TID")
		end,
	},
	{
		"ThePrimeagen/harpoon",
		branch = "harpoon2",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		config = function()
			require("config.harpoon")
		end,
	},
	{
		"aznhe21/actions-preview.nvim",
		config = function()
			require("config.actions-preview")
		end,
	},
	{
		"sbdchd/neoformat",
		config = function()
			require("config.neoformat")
		end,
	},
	{
	  "Zacharias-Brohn/zterm-navigator.nvim",
	  config = function()
	    require("config.zterm-navigator")
	  end,
	},
}
