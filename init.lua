vim.g.base46_cache = vim.fn.stdpath "data" .. "/base46/"
vim.g.mapleader = " "
vim.cmd("source ~/.config/nvim/test.vim")
require("configs.set")

vim.filetype.add({
    pattern = { [".*/hypr/.*%.conf"] = "hyprlang" },
})

-- bootstrap lazy and all plugins
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

if not vim.uv.fs_stat(lazypath) then
    local repo = "https://github.com/folke/lazy.nvim.git"
    vim.fn.system {
        "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath
    }
end

vim.opt.rtp:prepend(lazypath)

-- local lazy_config = require "configs.lazy"

-- load plugins
require("lazy").setup({
    import = "plugins",
    defaults = { lazy = false },
    install = { colorscheme = { "nvchad" } },

    ui = {
        icons = {
            ft = "",
            lazy = "󰂠 ",
            loaded = "",
            not_loaded = "",
        },
    },
})

-- load theme
dofile(vim.g.base46_cache .. "defaults")
dofile(vim.g.base46_cache .. "statusline")

require "nvchad.autocmds"


vim.schedule(function()
    require "mappings"
end)

