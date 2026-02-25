local M = {}

local function get_qmlls_client(bufnr)
	for _, c in ipairs(vim.lsp.get_clients { bufnr = bufnr }) do
		if c.name == "qmlls" then
			return c
		end
	end
end

local function first_client_encoding(bufnr)
	local c = vim.lsp.get_clients({ bufnr = bufnr })[1]
	return (c and c.offset_encoding) or "utf-16"
end

local function normalize_locations(result)
	if not result then
		return {}
	end
	-- Single Location / LocationLink
	if result.uri or result.targetUri then
		return { result }
	end
	-- Array of Location / LocationLink
	if vim.islist(result) then
		return result
	end
	return {}
end

local function request_locations(bufnr, method, timeout_ms)
	local enc = first_client_encoding(bufnr)
	local params = vim.lsp.util.make_position_params(0, enc)
	local responses =
		vim.lsp.buf_request_sync(bufnr, method, params, timeout_ms or 1000)

	if not responses then
		return {}
	end

	local all = {}
	for client_id, resp in pairs(responses) do
		local result = resp and resp.result
		local locs = normalize_locations(result)
		for _, loc in ipairs(locs) do
			table.insert(all, { client_id = client_id, loc = loc })
		end
	end
	return all
end

local function jump_to_first_location(bufnr, matches)
	if #matches == 0 then
		return false
	end

	local m = matches[1]
	local client = vim.lsp.get_client_by_id(m.client_id)
	local enc = (client and client.offset_encoding)
		or first_client_encoding(bufnr)

	local loc = m.loc
	-- Convert LocationLink -> Location-ish target for jump_to_location
	if loc.targetUri then
		loc = {
			uri = loc.targetUri,
			range = loc.targetSelectionRange or loc.targetRange,
		}
	end

	vim.lsp.util.jump_to_location(loc, enc)
	return true
end

local function get_cursor_context(bufnr)
	local pos = vim.api.nvim_win_get_cursor(0)
	local row = pos[1] - 1
	local col = pos[2]
	local line = vim.api.nvim_buf_get_lines(bufnr, row, row + 1, false)[1] or ""
	local cword = vim.fn.expand "<cword>"
	return row, col, line, cword
end

-- Tries to detect something like Config.save() and returns ("Config", "save")
local function detect_singleton_member_call(bufnr)
	local _, col, line, cword = get_cursor_context(bufnr)
	local before = line:sub(1, col + 1)

	-- If cursor is on "save" in Config.save(), this usually works.
	local singleton = before:match "([%a_][%w_]*)%s*%.[%w_]*$"
	if not singleton then
		-- If cursor is on "Config", this can also catch it.
		singleton = before:match "([%a_][%w_]*)%s*$"
		if singleton and not line:sub(col + 1):match "^%s*%." then
			singleton = nil
		end
	end

	if not singleton then
		return nil
	end

	-- Basic heuristic: singleton names are often capitalized in QML
	-- (you can remove this check if your singletons are lowercase)
	if not singleton:match "^[A-Z_]" then
		return nil
	end

	return singleton, cword
end

local function find_project_root(bufnr)
	local qmlls = get_qmlls_client(bufnr)
	if qmlls and qmlls.config and qmlls.config.root_dir then
		return qmlls.config.root_dir
	end
	return vim.fs.root(bufnr, { ".qmlls.ini", ".git" }) or vim.fn.getcwd()
end

local function singleton_fallback_jump(bufnr)
	local singleton, member = detect_singleton_member_call(bufnr)
	if not singleton then
		return false
	end

	local root = find_project_root(bufnr)
	local target_name = singleton .. ".qml"

	local matches = vim.fs.find(target_name, {
		path = root,
		type = "file",
		limit = math.huge,
	})

	if not matches or vim.tbl_isempty(matches) then
		return false
	end

	local pick = nil
	if #matches == 1 then
		pick = matches[1]
	else
		-- Prefer a path containing "/Config/" for Config.qml, etc.
		for _, p in ipairs(matches) do
			if
				p:match("/" .. singleton .. "/")
				or p:match("/" .. target_name .. "$")
			then
				pick = p
				break
			end
		end
		pick = pick or matches[1]
	end

	vim.cmd.edit(vim.fn.fnameescape(pick))

	-- Optional: try to jump near the member inside the singleton file.
	if member and member ~= singleton then
		local escaped = vim.fn.escape(member, [[\/]])
		-- Try function save(...) first, then any "save" occurrence.
		local found =
			vim.fn.search("\\<function\\s\\+" .. escaped .. "\\s*(", "W")
		if found == 0 then
			vim.fn.search("\\<" .. escaped .. "\\>", "W")
		end
	end

	vim.notify(
		("LSP returned no locations; fell back to %s.qml"):format(singleton),
		vim.log.levels.INFO
	)
	return true
end

function M.smart_qml_jump()
	local bufnr = vim.api.nvim_get_current_buf()

	-- 1) Try normal definition
	local defs = request_locations(bufnr, "textDocument/definition", 1200)
	if jump_to_first_location(bufnr, defs) then
		return
	end

	-- 2) Try type definition
	local tdefs = request_locations(bufnr, "textDocument/typeDefinition", 1200)
	if jump_to_first_location(bufnr, tdefs) then
		return
	end

	-- 3) Singleton fallback: Config.save() -> Config.qml
	if singleton_fallback_jump(bufnr) then
		return
	end

	vim.notify(
		"No locations found (definition/typeDefinition/fallback)",
		vim.log.levels.WARN
	)
end

return M
