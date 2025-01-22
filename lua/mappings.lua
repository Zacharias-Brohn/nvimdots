require "nvchad.mappings"

local map = vim.keymap.set

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

map('n', '<leader>u', vim.cmd.UndotreeToggle)

map("n", "<A-->", "<cmd>BufDel<cr>")

map("n", "<C-a>", "ggVG", { noremap = true, silent = true })
