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

if time >= 10 and time < 16 then
    vim.o.background = "light"
    vim.cmd[[colorscheme one_light]]
else
    vim.o.background = "dark"
    vim.cmd[[colorscheme gruvbox]]
end

local bg_color = vim.api.nvim_get_hl_by_name('Normal', true).background

vim.api.nvim_set_hl(0, 'WinSeparator', { fg = vim.api.nvim_get_hl_by_name('NvimTreeEndOfBuffer', true).foreground, bg = 'NONE' })
vim.api.nvim_set_hl(0, 'NvimTreeWinSeparator', { fg = bg_color, bg = 'NONE' })
vim.api.nvim_set_hl(0, 'NvimTreeCursorLine', { bg = vim.api.nvim_get_hl_by_name('CursorLine', true).background })
