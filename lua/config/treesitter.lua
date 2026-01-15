local treesitter = require'nvim-treesitter'

treesitter.setup {}

vim.api.nvim_create_autocmd('FileType', {
	callback = function(args)
		local has_parser = pcall(vim.treesitter.get_parser, args.buf)

		if not has_parser then
			return
		end

		vim.treesitter.start()
		vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
	end,
})
