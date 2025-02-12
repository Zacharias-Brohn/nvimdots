vim.g.base46_cache = vim.fn.stdpath "data" .. "/base46/"
vim.g.mapleader = " "
vim.cmd("source ~/.config/nvim/test.vim")
local time = tonumber(os.date "%H")

vim.filetype.add({
    pattern = { [".*/hypr/.*%.conf"] = "hyprlang" },
})
require("configs.set")

-- bootstrap lazy and all plugins
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

if not vim.uv.fs_stat(lazypath) then
    local repo = "https://github.com/folke/lazy.nvim.git"
    vim.fn.system {
        "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath
    }
end

vim.opt.rtp:prepend(lazypath)

local lazy_config = require "configs.lazy"

-- load plugins
require("lazy").setup({
    { import = "plugins" },
},  {
    rocks = {
        hererocks = true,
    }
},
lazy_config)

-- load colorscheme
if time >= 10 and time < 20 then
    require("nvconfig").base46.theme = "one_light"
else
    require("nvconfig").base46.theme = "gruvbox"
end
require("base46").load_all_highlights()

-- load theme
dofile(vim.g.base46_cache .. "syntax")
dofile(vim.g.base46_cache .. "defaults")
dofile(vim.g.base46_cache .. "statusline")

require "options"
require "nvchad.autocmds"


vim.schedule(function()
    require "mappings"
end)

