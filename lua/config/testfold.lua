local i = {}

function M.foldexpr()
	local lnum = vim.v.lnum
	local line = vim.fn.getline( lnum )
	if line:find( "<think>", 1, true ) then
		return "a1"
	elseif line:find( "</think>", 1, true ) then
		return "s1"
	else
		return "="
	end
end

return M
