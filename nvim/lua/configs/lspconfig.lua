-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

local lspconfig = require "lspconfig"

-- EXAMPLE
local nvlsp = require "nvchad.configs.lspconfig"
local default_servers = { "html", "cssls", "ts_ls", "ruby_lsp"}

-- lsps with default config
for _, lsp in ipairs(default_servers) do
  lspconfig[lsp].setup {
    on_attach = nvlsp.on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
  }
end

-- purescript
local function join_segments(...)
  local segments = { ... }
  return table.concat(segments, "/")
end
lspconfig.purescriptls.setup {
  on_attach = on_attach,
  settings = {
    purescript = {
      codegenTargets = { "corefn" },
      addSpagoSources = true,
    },
  },
  flags = {
    debounce_text_changes = 150,
  },
}

lspconfig.pyright.setup {
  on_attach = on_attach,
  on_init = on_init,
  capabilities = capabilities,
  filetypes = { "python" },
}
