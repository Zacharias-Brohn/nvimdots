vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.g.base46_cache = vim.fn.stdpath "data" .. "/base46/"
vim.g.mapleader = " "
vim.g.gruvbox_material_background = "medium"
vim.g.coq_settings = { keymap = { recommended = false } }
vim.g.gruvbox_material_foreground = "original"
vim.g.zig_fmt_parse_errors = 0
vim.g.zig_fmt_autosave = 0

vim.api.nvim_set_hl(0, 'GitGutterAdd', { fg = '#009900', ctermfg = 2 })
vim.api.nvim_set_hl(0, 'GitGutterChange', { fg = '#bbbb00', ctermfg = 3 })
vim.api.nvim_set_hl(0, 'GitGutterDelete', { fg = '#ff2222', ctermfg = 1 })
