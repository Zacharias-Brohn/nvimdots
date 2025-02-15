require("globals")
require("options")
require("config.lazy")
require("mappings")
vim.cmd("source ~/.config/nvim/suda.vim")
local time = tonumber( os.date "%H" )

vim.filetype.add({
    pattern = {
        [".*/hypr/.*%.conf"] = "hyprlang",
        [".*/uwsm/env.*"] = "zsh",
    }
})

if time >= 10 and time < 20 then
    vim.o.background = "light"
    vim.cmd[[colorscheme onedark]]
else
    vim.o.background = "dark"
    vim.cmd[[colorscheme gruvbox-material]]
end

