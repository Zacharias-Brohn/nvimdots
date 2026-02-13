local autocmd = vim.api.nvim_create_autocmd

autocmd("LspAttach", {
	callback = function(args)
		local client = vim.lsp.get_client_by_id(args.data.client_id)
		if client and vim.lsp.document_color and vim.lsp.document_color.enable then
			vim.lsp.document_color.enable(false, args.buf, { "background" })
		end
	end,
})

autocmd("VimLeave", {
	command = "set guicursor=a:ver25-Cursor",
})

autocmd("BufWritePre", {
	callback = function()
		local ok = pcall(function()
			vim.cmd "undojoin"
		end)
		vim.cmd "Neoformat"
	end,
})

-- fWindows
autocmd("VimLeavePre", {
    group = vim.api.nvim_create_augroup('fuck_shada_temp', { clear = true }),
    pattern = { '*' },
    callback = function()
        local status = 0
        for _, f in ipairs(vim.fn.globpath(vim.fn.stdpath('data') .. '/shada', '*tmp*', false, true)) do
            if vim.tbl_isempty(vim.fn.readfile(f)) then
                status = status + vim.fn.delete(f)
            end
        end
        if status ~= 0 then
            vim.notify('Could not delete empty temporary ShaDa files.', vim.log.levels.ERROR)
            vim.fn.getchar()
        end
    end,
    desc = "Delete empty temp ShaDa files"
})
