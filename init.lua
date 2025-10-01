require("config.lazy")
require("options")
require("globals")
require("mappings")
require("autocmd")

if vim.g.neovide then
    require("config.neovide")
end

vim.filetype.add({
    pattern = {
        [".*/hypr/.*%.conf"] = "hyprlang",
        [".*/uwsm/env.*"] = "zsh",
    }
})

vim.cmd[[colorscheme onedark]]
