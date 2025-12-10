local map = vim.keymap.set

map("n", "<Tab>", "<Cmd>BufferLineCycleNext<CR>")
map("n", "<S-Tab>", "<Cmd>BufferLineCyclePrev<CR>")

map("n", ";", ":", { desc = "CMD enter command mode" })

-- Move selected text up
map("v", "<C-Up>", ":m '<-2<CR>gv=gv", { desc = "Move selected text up" })
map("v", "<C-Down>", ":m '>+1<CR>gv=gv", { desc = "Move selected text down" })

-- Alt + Arrow Key to change buffer
map(
	"n",
	"<A-Left>",
	"<cmd>KittyNavigateLeft<CR>",
	{ desc = "Move to left split" }
)
map(
	"n",
	"<A-Down>",
	"<cmd>KittyNavigateDown<CR>",
	{ desc = "Move to bottom split" }
)
map("n", "<A-Up>", "<cmd>KittyNavigateUp<CR>", { desc = "Move to top split" })
map(
	"n",
	"<A-Right>",
	"<cmd>KittyNavigateRight<CR>",
	{ desc = "Move to right split" }
)

-- Copilot Chat buffer
map("n", "<A-c>", vim.cmd.CopilotChatToggle)
map("i", "<A-c>", vim.cmd.CopilotChatToggle)
map("v", "<A-c>", vim.cmd.CopilotChatToggle)

-- Explorer and Undotree
map("n", "<leader>e", function()
	Snacks.explorer()
end)
map(
	"n",
	"<leader>u",
	require("undotree").toggle,
	{ noremap = true, silent = true }
)

-- Telescope grep
map(
	"n",
	"<leader>g",
	require("telescope.builtin").live_grep,
	{ desc = "Telescope grep" }
)
map(
	"n",
	"<leader>f",
	require("telescope.builtin").find_files,
	{ desc = "Telescope find files" }
)

map("n", "<A-->", ":bdelete<CR>")
-- map("n", "<SA-->", ":BufferRestore<CR>")

map("n", "<C-a>", "ggVG", { noremap = true, silent = true })

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
	vim.cmd "so"
end)

map("n", "<A-v>", "<cmd>ChatGPT<CR>")

map(
	"n",
	"<leader>fm",
	"<cmd>TailwindConcealToggle<CR>",
	{ desc = "Toggle Tailwind Conceal" }
)

-- Terminal
map("n", "<C-q>", function()
	Snacks.terminal.toggle()
end, { desc = "Toggle Terminal" })

-- Gitbrowse
map("n", "<leader>gb", function()
	Snacks.gitbrowse.open()
end)

-- Actions Previewer
map({ "n", "v" }, "<leader>ap", require("actions-preview").code_actions)

map("n", "K", require("pretty_hover").hover)

-- winbar
local dbar_api = require "dropbar.api"
map("n", "<leader>b", dbar_api.pick)
