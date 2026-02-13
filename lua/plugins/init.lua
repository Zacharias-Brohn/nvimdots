return {
	{
		require("config.snacks")
	},
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
		cmd = "Copilot",
		event = "InsertEnter",
		config = function()
			require "config.ai.copilot"
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
			require "config.ai.copilotchat"
		end,
	},
	{
		"mfussenegger/nvim-dap",
		config = function()
			require("config.dapconf")
		end,
	},
	{
	    "mason-org/mason-lspconfig.nvim",
	    opts = {},
	    dependencies = {
	        { "mason-org/mason.nvim", opts = {} },
	        "neovim/nvim-lspconfig",
	    },
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
			"b0o/schemastore.nvim",
			"saghen/blink.cmp",
		},
		config = function()
			require("config.format.lspconfig")
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
			require("config.format.texlab")
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
			require("config.format.refactoring")
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
			require("config.terminal.tmux")
		end,
	},
	{
		"rachartier/tiny-inline-diagnostic.nvim",
		config = function ()
			require("config.format.TID")
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
			require("config.format.neoformat")
		end,
	},
	{
	  "Zacharias-Brohn/zterm-navigator.nvim",
	  config = function()
	    require("config.terminal.zterm-navigator")
	  end,
	},
	{
		"Fildo7525/pretty_hover",
		event = "LspAttach",
		opts = {},
	},
	{
		"artemave/workspace-diagnostics.nvim",
	},
}
