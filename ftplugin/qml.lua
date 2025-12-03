local gen_hook = MiniSplitjoin.gen_hook

local curly = { brackets = { '%b{}' }, separator = ';' }
local curly_semi = { brackets = { '%b{}' }, separator = ';' }
local add_semicolon_curly = gen_hook.add_trailing_separator(curly)
local remove_semicolon_curly = gen_hook.del_trailing_separator(curly)
local pad_curly = gen_hook.pad_brackets(curly_semi)

vim.b.minisplitjoin_config = {
	split = { hooks_post = { remove_semicolon_curly }},
	join = { hooks_pre = { add_semicolon_curly }, hooks_post = { pad_curly }},
}
