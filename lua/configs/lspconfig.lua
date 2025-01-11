-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()
-- require'lspconfig'.hyprls.setup{}
-- require'lspconfig'.texlab.setup{}

local lspconfig = require "lspconfig"
local nvlsp = require "nvchad.configs.lspconfig"

-- EXAMPLE
local servers = {
  "html",
  "cssls",
  "bashls",
  "texlab",
  "hyprls",
  "pyright",
  "ts_ls",
  "java_language_server",
  "sourcekit",
}

-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = nvlsp.on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
  }
end

-- configuring single server, example: typescript
-- lspconfig.ts_ls.setup {
--   on_attach = nvlsp.on_attach,
--   on_init = nvlsp.on_init,
--   capabilities = nvlsp.capabilities,
-- }
