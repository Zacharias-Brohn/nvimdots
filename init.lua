require("config.lazy")
require("options")
require("globals")
require("mappings")
require("autocmd")
require("minimodules").load_modules()
vim.cmd('source ' .. vim.fn.stdpath("config") .. "/cursor.vim")

if vim.g.neovide then
	require("config.neovide")
end

vim.filetype.add({
	pattern = {
		[".*/hypr/.*%.conf"] = "hyprlang",
		[".*/uwsm/env.*"] = "zsh",
	}
})

if vim.env.PROF then
	local snacks = vim.fn.stdpath("data") .. "/lazy/snacks.nvim"

	vim.opt.rtp:append( snacks )
	require("snacks.profiler").startup({
		startup = {
			event = "UIEnter",
		},
	})
end
