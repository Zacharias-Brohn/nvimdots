return {
    {
        "vhyrro/luarocks.nvim",
        priority = 1000,
        config = true,
    },

    {
        "cameronr/auto-session",
        opts = function()
            return require "configs.auto-session"
        end,
    },

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
        "smolck/command-completion.nvim",
        opts = {
            border = nil,
            highlight_selection = true,
            use_matchfuzzy = true,
        },
    },

    {
        "nvim-treesitter/nvim-treesitter",
        opts = function()
            require "configs.treesitter"
        end,
    },
    {
        "nvchad/base46",
        build = function()
            require("base46").load_all_highlights()
        end,
    },

    {
        "nvchad/ui",
        lazy = false,
        config = function()
            require "nvchad"
        end,
    },

    "nvzone/volt",
    "nvzone/menu",
    { "nvzone/minty", cmd = { "Huefy", "Shades" } },

    {
        "nvim-tree/nvim-web-devicons",
        opts = function()
            dofile(vim.g.base46_cache .. "devicons")
            return { override = require "nvchad.icons.devicons" }
        end,
    },

    {
        "lukas-reineke/indent-blankline.nvim",
        event = "User FilePost",
        opts = {
            indent = { char = "│", highlight = "IblChar" },
            scope = { char = "│", highlight = "IblScopeChar" },
        },
        config = function(_, opts)
            dofile(vim.g.base46_cache .. "blankline")

            local hooks = require "ibl.hooks"
            hooks.register(hooks.type.WHITESPACE, hooks.builtin.hide_first_space_indent_level)
            require("ibl").setup(opts)

            dofile(vim.g.base46_cache .. "blankline")
        end,
    },

    -- file managing , picker etc
    {
        "nvim-tree/nvim-tree.lua",
        cmd = { "NvimTreeToggle", "NvimTreeFocus" },
        opts = function()
            return require "nvchad.configs.nvimtree"
        end,
    },

    {
        "folke/which-key.nvim",
        keys = { "<leader>", "<c-w>", '"', "'", "`", "c", "v", "g" },
        cmd = "WhichKey",
        opts = function()
            dofile(vim.g.base46_cache .. "whichkey")
            return {}
        end,
    },

    -- git stuff
    {
        "lewis6991/gitsigns.nvim",
        event = "User FilePost",
        opts = function()
            return require "nvchad.configs.gitsigns"
        end,
    },

    -- lsp stuff
    {
        "williamboman/mason.nvim",
        cmd = { "Mason", "MasonInstall", "MasonUpdate" },
        opts = function()
            return require "nvchad.configs.mason"
        end,
    },

    -- load luasnips + cmp related in insert mode only
    {
        "hrsh7th/nvim-cmp",
        event = "InsertEnter",
        dependencies = {
            {
                -- snippet plugin
                "L3MON4D3/LuaSnip",
                dependencies = "rafamadriz/friendly-snippets",
                opts = { history = true, updateevents = "TextChanged,TextChangedI" },
                config = function(_, opts)
                    require("luasnip").config.set_config(opts)
                    require "nvchad.configs.luasnip"
                end,
            },

            -- autopairing of (){}[] etc
            {
                "windwp/nvim-autopairs",
                opts = {
                    fast_wrap = {},
                    disable_filetype = { "TelescopePrompt", "vim" },
                },
                config = function(_, opts)
                    require("nvim-autopairs").setup(opts)

                    -- setup cmp for autopairs
                    local cmp_autopairs = require "nvim-autopairs.completion.cmp"
                    require("cmp").event:on("confirm_done", cmp_autopairs.on_confirm_done())
                end,
            },

            -- cmp sources plugins
            {
                "saadparwaiz1/cmp_luasnip",
                "hrsh7th/cmp-nvim-lua",
                "hrsh7th/cmp-nvim-lsp",
                "hrsh7th/cmp-buffer",
                "hrsh7th/cmp-path",
            },
        },
        opts = function()
            return require "nvchad.configs.cmp"
        end,
    },

    {
        "nvim-telescope/telescope.nvim",
        dependencies = { "nvim-treesitter/nvim-treesitter" },
        cmd = "Telescope",
        opts = function()
            return require "nvchad.configs.telescope"
        end,
    },

    -- {
    --     "nvim-neorg/neorg",
    --     dependencies = "3rd/image.nvim",
    --     config = function()
    --         require "configs.neorg"
    --     end,
    -- },
}
