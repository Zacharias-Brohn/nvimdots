require("bufferline").setup ({
    options = {
        diagnostics = "coc",
        diagnostics_indicator = function(count, level, diagnostics_dict, context)
            local s = " "
            for e, n in pairs(diagnostics_dict) do
                local sym = e == "error" and " "
                or (e == "warning" and " " or " ")
                s = s .. n .. sym
            end
            return s
        end,
        always_show_bufferline = true,
        offsets = {
            {
                filetype = "NvimTree",
                text = "Explorer",
                text_align = "center",
            },
            {
                filetype = "snacks_layout_box",
            },
        },
        vim.api.nvim_create_autocmd({ "BufAdd", "BufDelete" }, {
            callback = function()
                vim.schedule(function()
                    pcall(nvim_bufferline)
                end)
            end,
        })
    },
})
