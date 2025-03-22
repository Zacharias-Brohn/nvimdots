require("globals")
require("options")
require("config.lazy")
require("mappings")
require("autocmd")

vim.filetype.add({
    pattern = {
        [".*/hypr/.*%.conf"] = "hyprlang",
        [".*/uwsm/env.*"] = "zsh",
    }
})

vim.cmd[[colorscheme gruvbox]]

local bg_color = vim.api.nvim_get_hl_by_name('Normal', true).background

vim.api.nvim_set_hl(0, 'WinSeparator', { fg = vim.api.nvim_get_hl_by_name('NvimTreeEndOfBuffer', true).foreground, bg = 'NONE' })
vim.api.nvim_set_hl(0, 'NvimTreeWinSeparator', { fg = bg_color, bg = 'NONE' })
vim.api.nvim_set_hl(0, 'NvimTreeCursorLine', { bg = vim.api.nvim_get_hl_by_name('CursorLine', true).background })
vim.api.nvim_set_hl(0, 'LspReferenceWrite', { bg = vim.api.nvim_get_hl_by_name('CursorLine', true).background })
vim.api.nvim_set_hl(0, 'LspReferenceText', { bg = vim.api.nvim_get_hl_by_name('CursorLine', true).background })
vim.api.nvim_set_hl(0, 'LspReferenceRead', { bg = vim.api.nvim_get_hl_by_name('CursorLine', true).background })
