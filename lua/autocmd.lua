local autocmd = vim.api.nvim_create_autocmd

autocmd("LspAttach", {
	callback = function(args)
		local client = vim.lsp.get_client_by_id( args.data.client_id )
		if client then
			vim.lsp.document_color.enable(false, args.buf, { "background" })
		end
	end,
})

autocmd("VimLeave", {
	command = "set guicursor=a:ver25-Cursor"
})

autocmd("BufWritePre", {
  callback = function()
    local ok = pcall(function()
      vim.cmd "undojoin"
    end)
    vim.cmd "Neoformat"
  end,
})
