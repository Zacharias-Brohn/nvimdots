require("bufferline").setup ({
	options = {
		diagnostics = "nvim_lsp",
		diagnostics_indicator = function(count, level, diagnostics_dict, context)
			local s = " "
			for e, n in pairs(diagnostics_dict) do
				local sym = e == "error" and " "
				or (e == "warning" and " " or " ")
				s = s .. n .. sym
			end
			return s
		end,
		show_close_icon = false,
		show_buffer_close_icons = false,
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
