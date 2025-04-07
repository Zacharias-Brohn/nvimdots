local map = vim.keymap.set
require("config.disable-default-keybinds")

map("n", "<Tab>", "<Cmd>BufferLineCycleNext<CR>")
map("n", "<S-Tab>", "<Cmd>BufferLineCyclePrev<CR>")

map("n", ";", ":", { desc = "CMD enter command mode" })

-- Move selected text up
map("v", "<C-Up>", ":m '<-2<CR>gv=gv", { desc = "Move selected text up" })
map("v", "<C-Down>", ":m '>+1<CR>gv=gv", { desc = "Move selected text down" })

-- Alt + Arrow Key to change buffer
map("n", "<A-Left>", "<C-w>h", { desc = "Move to left split" })
map("n", "<A-Down>", "<C-w>j", { desc = "Move to bottom split" })
map("n", "<A-Up>", "<C-w>k", { desc = "Move to top split" })
map("n", "<A-Right>", "<C-w>l", { desc = "Move to right split" })

-- Copilot Chat buffer
map("n", "<A-c>", vim.cmd.CopilotChatToggle)
map("i", "<A-c>", vim.cmd.CopilotChatToggle)
map("v", "<A-c>", vim.cmd.CopilotChatToggle)

-- map('n', '<leader>e', vim.cmd.NvimTreeToggle)
map("n", "<leader>e", function()
    Snacks.explorer()
end)
map("n", "<leader>u", require("undotree").toggle, { noremap = true, silent = true })

map("n", "<A-->", ":bdelete<CR>")
-- map("n", "<SA-->", ":BufferRestore<CR>")

map("n", "<C-a>", "ggVG", { noremap = true, silent = true })

map("n", "<leader>pv", vim.cmd.Ex)

map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")

map("n", "J", "mzJ`z")
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")
map("n", "<leader>zig", "<cmd>LspRestart<cr>")

-- greatest remap ever
map("x", "<leader>p", [["_dP]])

-- next greatest remap ever : asbjornHaland
map({ "n", "v" }, "<leader>y", [["+y]])
map("n", "<leader>Y", [["+Y]])

map({ "n", "v" }, "<leader>d", '"_d')

-- This is going to get me cancelled
map("i", "<C-c>", "<Esc>")

map("n", "<leader>mr", "<cmd>CellularAutomaton make_it_rain<CR>")

map("n", "<leader><leader>", function()
    vim.cmd("so")
end)

-- Tmux binds
map("n", "<C-A-Left>", "<cmd>lua require('tmux').move_left()<CR>")
map("n", "<C-A-Down>", "<cmd>lua require('tmux').move_bottom()<CR>")
map("n", "<C-A-Up>", "<cmd>lua require('tmux').move_top()<CR>")
map("n", "<C-A-Right>", "<cmd>lua require('tmux').move_right()<CR>")

map("n", "<A-S-Left>", "<cmd>lua require('tmux').resize_left()<CR>")
map("n", "<A-S-Down>", "<cmd>lua require('tmux').resize_bottom()<CR>")
map("n", "<A-S-Up>", "<cmd>lua require('tmux').resize_top()<CR>")
map("n", "<A-S-Right>", "<cmd>lua require('tmux').resize_right()<CR>")

map("n", "<leader><Left>", "<cmd>lua require('tmux').swap_left()<CR>")
map("n", "<leader><Down>", "<cmd>lua require('tmux').swap_bottom()<CR>")
map("n", "<leader><Up>", "<cmd>lua require('tmux').swap_top()<CR>")
map("n", "<leader><Right>", "<cmd>lua require('tmux').swap_right()<CR>")
