return {
    {
        "stevearc/conform.nvim",
        -- event = 'BufWritePre', -- uncomment for format on save
        opts = require "configs.conform",
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
        opts = {
            -- See Configuration section for options
        },
    },

    {
        "rmagatti/auto-session",
        opts = {
            enabled = true,
            root_dir = vim.fn.stdpath "data" .. "/sessions/",
            auto_save = true,
            auto_restore = true,
            auto_create = true,
            suppressed_dirs = nil,
            allowed_dirs = nil,
            auto_restore_last_session = false,
            use_git_branch = false,
            lazy_support = true,
            bypass_save_filetypes = nil,
            close_unsupported_windows = true,
            args_allow_single_directory = true,
            args_allow_files_auto_save = false,
            continue_restore_on_error = true,
            show_auto_restore_notif = false,
            cwd_change_handling = false,
            lsp_stop_on_restore = false,
            log_level = "error",

            session_lens = {
                load_on_setup = true,
                theme_conf = {
                    -- test
                },
                previewer = false,

                mappings = {
                    delete_session = { "i", "<C-D>" },
                    alternate_session = { "i", "<C-S>" },
                    copy_session = { "i", "<C-Y>" },
                },

                session_control = {
                    control_dir = vim.fn.stdpath "data" .. "/auto_session/",
                    control_filename = "session_control.json",
                },
            },
        },
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
