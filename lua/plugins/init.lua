return {
    {
        "stevearc/conform.nvim",
        -- event = 'BufWritePre', -- uncomment for format on save
        opts = require "configs.conform",
    },

    { "hiphish/rainbow-delimiters.nvim" },

    {
        "NeogitOrg/neogit",
        dependencies = {
            "nvim-lua/plenary.nvim",         -- required
            "sindrets/diffview.nvim",        -- optional - Diff integration

            -- Only one of these is needed.
            "nvim-telescope/telescope.nvim", -- optional
            "ibhagwan/fzf-lua",              -- optional
            "echasnovski/mini.pick",         -- optional
        },
        config = function()
            require "configs.neogit"
        end,
    },

    {
        "tpope/vim-fugitive",
    },

    {
        "mbbill/undotree",
    },

    {
        "andweeb/presence.nvim",
    },

    {
        "kwkarlwang/bufresize.nvim",
        config = function()
            require "configs.bufresize"
        end,
    },

    {
        "nvim-focus/focus.nvim",
        config = function()
            require "configs.focus"
        end,
    },

    {
        "mfussenegger/nvim-dap",
        config = function()
            require "configs.dap"
        end,
    },

    -- {
    --     "mfussenegger/nvim-jdtls",
    --     lazy = true,
    --     dependencies = {
    --         "mfussenegger/nvim-dap",
    --     },
    --     config = function()
    --         require "configs.jdtls"
    --     end,
    -- },

    -- These are some examples, uncomment them if you want to see them work!
    {
        "neovim/nvim-lspconfig",
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
            require "configs.lspconfig"
        end,
    },

    { "lambdalisue/vim-suda" },

    {
        "rcarriga/nvim-notify",
        config = function()
            require "configs.notify"
        end,
    },

    {
        "ojroques/nvim-bufdel",
        opts = {
            next = 'tabs',
            quit = true,
        },
    },

    {
        "zbirenbaum/copilot.lua",
        lazy = true,
        cmd = "Copilot",
        event = "InsertEnter",
        config = function()
            require "configs.copilot"
        end,
    },

    {
        "CopilotC-Nvim/CopilotChat.nvim",
        dependencies = {
            { "zbirenbaum/copilot.lua" }, -- or zbirenbaum/copilot.lua
            { "nvim-lua/plenary.nvim", branch = "master" }, -- for curl, log and async functions
        },
        build = "make tiktoken", -- Only on MacOS or Linux
        config = function()
            require "configs.copilotchat"
        end,
    },

    {
        "rmagatti/auto-session",
        config = function()
            require "configs.auto-session"
        end,
    },

    {
        "smolck/command-completion.nvim",
        opts = {
            border = nil,
            highlight_selection = true,
            use_matchfuzzy = true,
        },
    },

    {
        "nvim-treesitter/nvim-treesitter",
        opts = {
            ensure_installed = "all",
            sync_install = false,
            auto_install = true,
            highlight = {
                enable = true,
                additional_vim_regex_highlighting = false,
            },
        },
    },
}
