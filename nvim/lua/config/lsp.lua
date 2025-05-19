require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = { "clangd", "rust_analyzer", "pyright", "ts_ls", "lua_ls", "cssls", "jdtls" },
})

local lspconfig = require("lspconfig")
local capabilities = require("cmp_nvim_lsp").default_capabilities()

-- General LSP setup
local servers = { "rust_analyzer", "pyright", "ts_ls", "lua_ls", "jdtls" }
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup({
    capabilities = capabilities,
  })
end

-- Clangd-specific setup
lspconfig.clangd.setup({
  capabilities = capabilities,
  cmd = {
    "clangd",
    "--log=verbose",
    "--pretty",
    "--enable-config",
    "--clang-tidy",
    "--background-index",
    "--completion-style=detailed",
  },
  settings = {
    clangd = {
      InlayHints = { Enabled = true },
      Diagnostics = {
        EnableCodeActions = true,
        IncludeFixes = true,
        Suppress = false,
      },
    },
  },
})

-- CSS-specific setup
lspconfig.cssls.setup({
  capabilities = capabilities,
  settings = {
    css = {
      validate = true,
      lint = {
        unknownAtRules = "ignore",
      },
    },
    scss = {
      validate = true,
      lint = {
        unknownAtRules = "ignore",
      },
    },
    less = {
      validate = true,
      lint = {
        unknownAtRules = "ignore",
      },
    },
  },
  on_init = function(client)
    client.server_capabilities.workspace = {
      diagnostics = false,
    }
    return true
  end,
})

-- Diagnostic configuration
vim.diagnostic.config({
  virtual_text = {
    prefix = '●',
    source = "always",
  },
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = true,
})

-- Quickfix keymappings
vim.api.nvim_create_autocmd("FileType", {
  pattern = "qf",
  callback = function()
    local opts = { buffer = true, noremap = true, silent = true }
    vim.keymap.set('n', 'j', '<Down>', opts)
    vim.keymap.set('n', 'k', '<Up>', opts)
    vim.keymap.set('n', '<CR>', '<CR>', opts)
    vim.keymap.set('n', 'q', ':cclose<CR>', opts)
  end,
  desc = "Set quickfix keymappings",
})

-- Keymaps for diagnostics
vim.keymap.set('n', '<leader>e', function()
  vim.diagnostic.open_float({
    scope = "line",
    border = "rounded",
    max_width = 80,
    source = "always",
    format = function(diagnostic)
      local message = diagnostic.message
      if diagnostic.code then
        message = string.format("[%s] %s", diagnostic.code, message)
      end
      if diagnostic.relatedInformation then
        for _, related in ipairs(diagnostic.relatedInformation) do
          message = message .. '\n' .. related.message
        end
      end
      return message
    end,
  })
end, { desc = "Show detailed diagnostic" })

vim.keymap.set('n', '<leader>q', function()
  vim.diagnostic.setqflist({ open = false, title = "Diagnostics" })
  vim.cmd('copen')
  vim.cmd('wincmd J')
end, { desc = "Show all diagnostics in quickfix" })

vim.keymap.set('n', '<leader>h', vim.lsp.buf.hover, { desc = "Show hover information" })
