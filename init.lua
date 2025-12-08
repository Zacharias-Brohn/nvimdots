if vim.env.PROF then
	local snacks = vim.fn.stdpath("data") .. "/lazy/snacks.nvim"

	vim.opt.rtp:append( snacks )
	require("snacks.profiler").startup({
		startup = {
			event = "UIEnter",
		},
	})
end

vim.g.wbr = "test"

local home = os.getenv("HOME")

package.path = package.path
  .. ";" .. home .. "/.luarocks/share/lua/5.4/?.lua"
  .. ";" .. home .. "/.luarocks/share/lua/5.4/?/init.lua"

package.cpath = package.cpath
  .. ";" .. home .. "/.luarocks/lib/lua/5.4/?.so"

vim.cmd('source ' .. vim.fn.stdpath("config") .. "/cursor.vim")
require("config.lazy")
require("options")
require("globals")
require("mappings")
require("autocmd")
require("minimodules").load_modules()
-- require("coc-settings")

if vim.g.neovide then
	require("config.neovide")
end

vim.filetype.add({
	pattern = {
		[".*/hypr/.*%.conf"] = "hyprlang",
		[".*/uwsm/env.*"] = "zsh",
	}
})

vim.cmd("colorscheme github_dark")
