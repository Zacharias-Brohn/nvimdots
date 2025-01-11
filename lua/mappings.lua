-- local function resize_left()
--   local cur_win = vim.api.nvim_get_current_win()
--   vim.cmd('wincmd h')
--   local new_win = vim.api.nvim_get_current_win()
--   if cur_win == new_win then
--     vim.cmd('vertical resize -10')
--   elseif vim.bo[new_win].filetype == 'NvimTree' then
--
--   else
--     vim.cmd('vertical resize -10')
--     vim.cmd('wincmd l')
--   end
-- end
--
-- local function resize_right()
--   local cur_win = vim.api.nvim_get_current_win()
--   vim.cmd('wincmd l')
--   local new_win = vim.api.nvim_get_current_win()
--   if cur_win == new_win then
--     vim.cmd('vertical resize -10')
--   else
--     vim.cmd('vertical resize -10')
--     vim.cmd('wincmd h')
--   end
-- end

require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- Alt + Arrow Key to change buffer
map("n", "<A-Left>", "<C-w>h", { desc = "Move to left split" })
map("n", "<A-Down>", "<C-w>j", { desc = "Move to bottom split" })
map("n", "<A-Up>", "<C-w>k", { desc = "Move to top split" })
map("n", "<A-Right>", "<C-w>l", { desc = "Move to right split" })

-- Copilot Chat buffer
map("n", "<A-tab>", vim.cmd.CopilotChatToggle)
map("i", "<A-tab>", vim.cmd.CopilotChatToggle)
map("v", "<A-tab>", vim.cmd.CopilotChatToggle)

map('n', '<leader>u', vim.cmd.UndotreeToggle)

map("n", "<A-->", "<cmd>BufDel<cr>")

map("n", "<C-a>", "ggVG", { noremap = true, silent = true })

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
