require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })

-- Alt + Arrow Key to change buffer
map("n", "<A-Left>", "<C-w>h", { desc = "Move to left split" })
map("n", "<A-Down>", "<C-w>j", { desc = "Move to bottom split" })
map("n", "<A-Up>", "<C-w>k", { desc = "Move to top split" })
map("n", "<A-Right>", "<C-w>l", { desc = "Move to right split" })

-- Copilot suggestion
-- map("i", "jk", vim.cmd("Copilot suggestion accept_word"), { expr = true })

-- Copilot Chat buffer
map("n", "<A-c>", vim.cmd.CopilotChatToggle)
map("i", "<A-c>", vim.cmd.CopilotChatToggle)
map("v", "<A-c>", vim.cmd.CopilotChatToggle)

map('n', '<leader>u', vim.cmd.UndotreeToggle)

map("n", "<A-->", "<cmd>BufDel<cr>")

map("n", "<C-a>", "ggVG", { noremap = true, silent = true })

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
