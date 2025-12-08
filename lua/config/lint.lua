require("lint").linters_by_ft = {
	javascript = { "eslint" },
	javascriptreact = { "eslint" },
	typescript = { "eslint" },
	typescriptreact = { "eslint" },
	lua = { "luacheck" },
	python = { "pylint" },
	go = { "golangci_lint" },
	rust = { "clippy" },
	zsh = { "zsh" },
	sh = { "zsh" },
	bash = { "zsh" },
	cpp = { "cpplint" },
	markdown = { "markdownlint" },
	json = { "jsonlint" },
	yaml = { "yamllint" },
	qml = { "qmllint" },
}

local default_severity = {
	['error'] = vim.diagnostic.severity.ERROR,
	['warning'] = vim.diagnostic.severity.WARN,
	['information'] = vim.diagnostic.severity.INFO,
	['hint'] = vim.diagnostic.severity.HINT,
}
require("lint").linters.qmllint = {
	name = "qmllint",
	cmd = "qmllint",
	stdin = true,
	append_fname = true,
	args = {},
	stream = nil,
	ignore_exitcode = true,
	env = nil,
	parser = require("lint.parser").from_pattern(
		"([^:]+):(%d+) : (.+)",
		{ "filename", "lnum", "message" },
		default_severity,
		{[ "source" ] = "qmllint" }
	)
}
