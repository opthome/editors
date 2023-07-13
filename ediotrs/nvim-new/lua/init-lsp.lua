-- autocomplete
require('init-cmp')

-- language servers
require('coding.awk')
require('coding.shell')
require('coding.javascript')
require('coding.cpp')
require('coding.python')
require('coding.lua')

-- Add additional capabilities supported by nvim-cmp
local capabilities = require("cmp_nvim_lsp").default_capabilities()
local lspconfig = require('lspconfig')

-- Enable some language servers with the additional completion capabilities offered by nvim-cmp
local servers = { 'pyright', 'tsserver', 'bashls', 'awk_ls', 'clangd', 'lua_ls' }
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    -- on_attach = my_custom_on_attach,
    capabilities = capabilities,
  }
end



