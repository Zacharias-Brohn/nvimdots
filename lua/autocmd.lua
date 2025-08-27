local autocmd = vim.api.nvim_create_autocmd

autocmd("LspAttach", {
    callback = function(args)
        vim.lsp.document_color.enable(false, args.buf, { "background" })
    end,
})
