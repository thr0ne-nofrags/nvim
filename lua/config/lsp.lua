-- ~/.config/nvim/lua/config/lsp.lua
local lspconfig = require("lspconfig")
local lsp_keymaps = require("config.lsp_keymaps")

lspconfig.util.default_config.on_attach = function(client, bufnr)
  lsp_keymaps.on_attach(client, bufnr)
end

