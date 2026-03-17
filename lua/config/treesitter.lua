local treesitter = require "nvim-treesitter"

treesitter.install { "all" }

local parsers = treesitter.get_installed()

vim.api.nvim_create_autocmd("FileType", {
	pattern = parsers,
	callback = function()
		vim.treesitter.start()
		vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
	end,
})
