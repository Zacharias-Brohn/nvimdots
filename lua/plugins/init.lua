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
        "neoclide/coc.nvim",
        branch = 'release',
    },
    -- {
    --     "sainnhe/gruvbox-material",
    -- },
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
    -- {
    --     "itchyny/lightline.vim",
    -- },
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
    -- {
    --     "lukas-reineke/indent-blankline.nvim",
    --     main = "ibl",
    --     ---@module "ibl"
    --     ---@type ibl.config
    --     config = function()
    --         require("config.indent-blankline")
    --     end,
    -- },
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
            require("config.dap")
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
}
