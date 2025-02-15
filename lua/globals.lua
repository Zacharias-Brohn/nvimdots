local time = tonumber( os.date "%H" )
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.g.base46_cache = vim.fn.stdpath "data" .. "/base46/"
vim.g.mapleader = " "
vim.g.gruvbox_material_background = "medium"
vim.g.coq_settings = { keymap = { recommended = false } }
vim.g.gruvbox_material_foreground = "original"
if time >= 10 and time < 20 then
    vim.g.lightline = {
        colorscheme = "one",
    }
else
    vim.g.lightline = {
        colorscheme = "gruvbox",
    }
end
