local M = {}

M.plugin = {
  "sbdchd/neoformat",
  config = function()
    vim.g.neoformat_enabled_lua = { "luaformatter" }
    vim.g.neoformat_enabled_python = { "black" }
    vim.g.neoformat_enabled_javascript = { "prettier" }
    vim.g.neoformat_enabled_typescript = { "prettier" }
    vim.g.neoformat_enabled_qml = { "qmlformat" }
    vim.g.neoformat_enabled_go = { "gofmt" }
    vim.g.neoformat_enabled_sh = { "shfmt" }
    vim.g.neoformat_enabled_bash = { "shfmt" }
    vim.g.neoformat_enabled_zsh = { "shfmt" }
    vim.g.neoformat_enabled_powershell = { "pwshfmt" } -- experimental
  end,
}

return M
