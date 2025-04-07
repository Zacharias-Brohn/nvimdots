vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.g.base46_cache = vim.fn.stdpath("data") .. "/base46/"
vim.g.mapleader = " "
vim.g.gruvbox_material_background = "medium"
vim.g.coq_settings = { keymap = { recommended = false } }
vim.g.gruvbox_material_foreground = "original"
vim.api.nvim_set_hl(0, "GitGutterAdd", { fg = "#009900", ctermfg = 2 })
vim.api.nvim_set_hl(0, "GitGutterChange", { fg = "#bbbb00", ctermfg = 3 })
vim.api.nvim_set_hl(0, "GitGutterDelete", { fg = "#ff2222", ctermfg = 1 })

local bg_color = vim.api.nvim_get_hl(0, { name = "Normal" }).bg or "NONE"

vim.api.nvim_set_hl(
    0,
    "WinSeparator",
    { fg = vim.api.nvim_get_hl(0, { name = "NvimTreeEndOfBuffer" }).fg or "NONE", bg = "NONE" }
)
vim.api.nvim_set_hl(0, "WinSeparator", { fg = bg_color, bg = "NONE" })
vim.api.nvim_set_hl(0, "CursorLine", { bg = vim.api.nvim_get_hl(0, { name = "CursorLine" }).bg or "NONE" })
vim.api.nvim_set_hl(0, "LspReferenceWrite", { bg = vim.api.nvim_get_hl(0, { name = "CursorLine" }).bg or "NONE" })
vim.api.nvim_set_hl(0, "LspReferenceText", { bg = vim.api.nvim_get_hl(0, { name = "CursorLine" }).bg or "NONE" })
vim.api.nvim_set_hl(0, "LspReferenceRead", { bg = vim.api.nvim_get_hl(0, { name = "CursorLine" }).bg or "NONE" })
