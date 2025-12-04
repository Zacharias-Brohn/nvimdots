require'nvim-treesitter.configs'.setup {
	ensure_installed = "all",
	ignore_install = { "ipkg" },
	sync_install = true,
	auto_install = true,
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false,
	},
	indent = {
		enable = true,
	},
}
