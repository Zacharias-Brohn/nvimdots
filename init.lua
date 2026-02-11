if vim.env.PROF then
	local snacks = vim.fn.stdpath("data") .. "/lazy/snacks.nvim"

	vim.opt.rtp:append( snacks )
	require("snacks.profiler").startup({
		startup = {
			event = "UIEnter",
		},
	})
end

vim.api.nvim_create_autocmd({ 'VimLeavePre' }, {
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

vim.cmd('source ' .. vim.fn.stdpath("config") .. "/cursor.vim")
require("config.lazy")
require("options")
require("globals")
require("mappings")
require("autocmd")
require("minimodules").load_modules()

if vim.g.neovide then
	require("config.neovide")
end

vim.filetype.add({
	pattern = {
		[".*/hypr/.*%.conf"] = "hyprlang",
		[".*/uwsm/env.*"] = "zsh",
	}
})
