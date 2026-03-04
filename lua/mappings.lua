local map = vim.keymap.set

-- Base nvim mappings, you need this.
map("n", "<Tab>", "<Cmd>BufferLineCycleNext<CR>")
map("n", "<S-Tab>", "<Cmd>BufferLineCyclePrev<CR>")
map({"n", "v"}, "<leader>ap", require("actions-preview").code_actions)
map("n", ";", ":", { desc = "CMD enter command mode" })
map("v", "<C-Up>", ":m '<-2<CR>gv=gv", { desc = "Move selected text up" })
map("v", "<C-Down>", ":m '>+1<CR>gv=gv", { desc = "Move selected text down" })
map("n", "<C-a>", "ggVG", { noremap = true, silent = true })
map("n", "<C-j>", "<C-d>zz")
map("n", "<C-k>", "<C-u>zz")
map("n", "<A-->", ":bdelete<CR>")
-- map("n", "<SA-->", ":BufferRestore<CR>")
map('n', '<leader>e', function() Snacks.explorer() end)
map('n', '<leader>u', require('undotree').toggle, { noremap = true, silent = true })
map("n", "<leader>g", require("telescope.builtin").live_grep, {desc = "Telescope grep" })
map("n", "<leader>f", require("telescope.builtin").find_files, {desc = "Telescope find files" })

-- Copilot Chat buffer
map("n", "<A-c>", vim.cmd.CopilotChatToggle)
map("i", "<A-c>", vim.cmd.CopilotChatToggle)
map("v", "<A-c>", vim.cmd.CopilotChatToggle)

-- LSP Restart
map("n", "<leader>zig", "<cmd>LspRestart<cr>")

-- Why?
map("x", "<leader>p", [["_dP]])
map({"n", "v"}, "<leader>y", [["+y]])
map({"n", "v"}, "<leader>d", "\"_d")
map("n", "<leader>mr", "<cmd>CellularAutomaton make_it_rain<CR>");
map("n", "<leader><leader>", function()
	vim.cmd("so")
end)

-- Greatest remap
map("n", "<leader>Y", [["+Y]])
map("n", "<A-q>", function() Snacks.terminal.toggle() end, { desc = "Toggle Terminal" })
map("n", "<leader>gb", function() Snacks.gitbrowse.open() end )
map("n", "K", require("pretty_hover").hover)

-- Might delete later
map("n", "<leader>fm", "<cmd>TailwindConcealToggle<CR>", { desc = "Toggle Tailwind Conceal" })
map("n", "<A-v>", "<cmd>ChatGPT<CR>")

-- Notif history
map("n", "<leader>n", function()
	Snacks.notifier.show_history()
end)

-- Actions Previewer
map({ "n", "v" }, "<leader>ap", require("actions-preview").code_actions)
