return {
	{
		"nvim-mini/mini.nvim",
		version = false,

		modules = function()
			require "config.mini-modules"
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter",
		lazy = false,
		build = ":TSUpdate",
		config = function()
			require "config.treesitter"
		end,
	},
	{
		"rmagatti/auto-session",
		config = function()
			require "config.autosession"
		end,
	},
	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		config = function()
			require "config.telescope"
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
			require "config.barbar"
		end,
	},
	{
		"nvim-lualine/lualine.nvim",
		event = "VeryLazy",
		config = function()
			require "config.lualine"
		end,
	},
	{
		"mawkler/modicator.nvim",
		config = function()
			require "config.modicator"
		end,
	},
	{
		"jiaoshijie/undotree",
		config = function()
			require "config.undotree"
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
			require "config.autopairs"
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
			require "config.dapconf"
		end,
	},
	{
		require "config.snacks",
	},
	{
		"folke/lazydev.nvim",
		ft = "lua",
		opts = function()
			require "config.lazydev"
		end,
	},
	{
		"neovim/nvim-lspconfig",
		enabled = true,
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			"L3MON4D3/LuaSnip",
			-- "saadparwaiz1/cmp_luasnip",
			"j-hui/fidget.nvim",
			"b0o/schemastore.nvim",
			"saghen/blink.cmp",
		},
		config = function()
			require "config.lspconfig"
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
		"ThePrimeagen/harpoon",
		branch = "harpoon2",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		config = function()
			require "config.harpoon"
		end,
	},
	-- {
	-- 	"catgoose/nvim-colorizer.lua",
	-- 	config = function()
	-- 		require("config.colorizer")
	-- 	end,
	-- },
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
			require "config.texlab"
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
			require "config.refactoring"
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
		"propet/colorscheme-persist.nvim",
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
		opts = {
			picker_opts = require("telescope.themes").get_dropdown {
				enable_preview = true,
			},
		},
	},
	{
		"aznhe21/actions-preview.nvim",
		config = function()
			require "config.actions-preview"
		end,
	},
	{
		"mfussenegger/nvim-lint",
		config = function()
			require "config.lint"
		end,
	},
	{
		"rachartier/tiny-inline-diagnostic.nvim",
		config = function()
			require "config.TID"
		end,
	},
	{
		"MunifTanjim/nui.nvim",
	},
	{
		"artemave/workspace-diagnostics.nvim",
	},
	{
		require "config.dev-tools",
	},
	{
		"Fildo7525/pretty_hover",
		event = "LspAttach",
		opts = {},
	},
	{
		"knubie/vim-kitty-navigator",
		build = "cp ./*.py ~/.config/kitty/",
	},
	{
		require "config.dropbar",
	},
	{
		require "config.blink",
	},
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require "config.gitsigns"
		end,
	},
	{
		"sbdchd/neoformat",
		init = function()
			vim.cmd(
				"source "
					.. vim.fn.stdpath "config"
					.. "/lua/plugins/neoformat.vim"
			)
		end,
	},
	{
		"petertriho/nvim-scrollbar",
		config = function()
			require "config.scrollbar"
		end,
	},
	{
		"Zacharias-Brohn/zterm-navigator.nvim",
		config = function()
			require "config.zterm-navigator"
		end,
	},
}
