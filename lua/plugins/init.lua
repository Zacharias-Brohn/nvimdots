return {
    {
        "nvim-treesitter/nvim-treesitter",
        config = function()
            require("config.treesitter")
        end,
    },

    {
        "rmagatti/auto-session",
        config = function()
            require("config.autosession")
        end,
    },
    {
        "olimorris/onedarkpro.nvim",
        config = function()
            require("config.themelight")
        end,
    },
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
        "lambdalisue/vim-suda",
        init = function()
            vim.g.suda_smart_edit = 1
            -- vim.g["suda#noninteractive"] = 1
        end,
    },
    {
        "nvim-tree/nvim-web-devicons",
    },
    {
        "nvim-tree/nvim-tree.lua",
        cmd = { "NvimTreeToggle", "NvimTreeFocus" },
        config = function()
            require("config.nvimtree")
        end,
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
            require("config.lualine")
        end,
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
            { "zbirenbaum/copilot.lua" }, -- or zbirenbaum/copilot.lua
            { "nvim-lua/plenary.nvim", branch = "master" }, -- for curl, log and async functions
        },
        build = "make tiktoken", -- Only on MacOS or Linux
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
                    enabled = false,
                    underline = true,
                    animate = {
                        enabled = true,
                        fps = 144,
                        easing = "inExpo",
                        duration = 20,
                    },
                },
                chunk = {
                    enabled = true,
                    char = {
                        corner_top = "╭",
                        corner_bottom = "╰",
                        vertical = "│",
                        arrow = "╼",
                    },
                },
            },
            input = { enabled = true },
            picker = { enabled = true },
            notifier = { enabled = true },
            quickfile = { enabled = true },
            scope = { enabled = true },
            scroll = { enabled = false },
            statuscolumn = { enabled = true },
            words = { enabled = true },
        },
    },
    {
        "notken12/base46-colors",
    },
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
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
        config = function()
            require("config.harpoon")
        end,
    },
}
