require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = { "clangd", "rust_analyzer", "pyright", "ts_ls", "lua_ls", "cssls", "jdtls" },
})

local lspconfig = require("lspconfig")
local capabilities = require("cmp_nvim_lsp").default_capabilities()

local servers = { "clangd", "rust_analyzer", "pyright", "ts_ls", "lua_ls", "cssls", "jdtls" }
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup({
    capabilities = capabilities,
  })
end

require("lspconfig").cssls.setup {
  capabilities = capabilities,
  settings = {
    css = { validate = true },
    scss = { validate = true },
    less = { validate = true },
  }
}
