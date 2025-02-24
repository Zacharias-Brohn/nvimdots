require("globals")
require("options")
require("config.lazy")
require("mappings")
require("autocmd")
require("api")
vim.cmd("source ~/.config/nvim/suda.vim")

vim.filetype.add({
    pattern = {
        [".*/hypr/.*%.conf"] = "hyprlang",
        [".*/uwsm/env.*"] = "zsh",
    }
})

vim.o.background = "dark"
vim.cmd[[colorscheme catppuccin]]
