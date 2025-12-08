local autocmd = vim.api.nvim_create_autocmd

autocmd("LspAttach", {
	callback = function(args)
		local client = vim.lsp.get_client_by_id( args.data.client_id )
		if client then
			vim.lsp.document_color.enable(false, args.buf, { "background" })
			-- require("workspace-diagnostics").populate_workspace_diagnostics(client, 0)
		end
	end,
})

autocmd("VimLeave", {
	command = "set guicursor=a:ver25-Cursor"
})

-- autocmd({ "CursorHold" }, {
-- 	callback = function()
-- 		vim.diagnostic.open_float(nil, { focus = false })
-- 	end
-- })

autocmd({ "InsertLeave" }, {
	callback = function()
		require("lint").try_lint()
	end
})
