require("config.lazy")
require("options")
vim.cmd[[colorscheme gruvbox]]
require("globals")
require("mappings")
require("autocmd")

vim.filetype.add({
    pattern = {
        [".*/hypr/.*%.conf"] = "hyprlang",
        [".*/uwsm/env.*"] = "zsh",
    }
})

