local M = {}

function M.load_modules()
	local modules_path = vim.fn.stdpath("config") .. "/lua/config/modules"
	local modules = vim.fn.globpath(modules_path, "*.lua", false, true)

	for _, module_file in ipairs(modules) do
		local module_name = vim.fn.fnamemodify(module_file, ":t:r")

		local ok, err = pcall(require, "config.modules." .. module_name)
		if not ok then
			vim.notify("Failed to load module: " .. module_name .. "\n" .. err, vim.log.levels.ERROR)
		end
	end
end

return M
