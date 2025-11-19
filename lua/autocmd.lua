local autocmd = vim.api.nvim_create_autocmd

autocmd("LspAttach", {
    callback = function(args)
        vim.lsp.document_color.enable(false, args.buf, { "background" })
    end,
})

vim.api.nvim_create_autocmd("VimLeave", {
    command = "set guicursor=a:ver25-Cursor"
})

vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
   callback = function()
     vim.diagnostic.open_float(nil, { focus = false })
   end
})
