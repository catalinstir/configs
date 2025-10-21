-- Mason
require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = { "clangd", "rust_analyzer", "pyright", "ts_ls", "lua_ls", "cssls", "jdtls", "omnisharp", "texlab" },
})

local capabilities = require("cmp_nvim_lsp").default_capabilities()

-- Omnisharp
local omnisharp_bin = vim.fn.stdpath("data") .. "/mason/packages/omnisharp/OmniSharp"
vim.lsp.config("omnisharp", {
  cmd = { omnisharp_bin, "--languageserver", "--hostPID", tostring(vim.fn.getpid()) },
  capabilities = capabilities,
  enable_editorconfig_support = true,
  enable_ms_build_load_projects_on_demand = false,
  enable_roslyn_analyzers = true,
  organize_imports_on_format = true,
  enable_import_completion = true,
  sdk_include_prereleases = true,
  analyze_open_documents_only = false,
})

-- General lsp
local servers = { "rust_analyzer", "pyright", "ts_ls", "lua_ls", "jdtls", "texlab" }
for _, server in ipairs(servers) do
  vim.lsp.config(server, {
    capabilities = capabilities,
  })
end

-- clangd
vim.lsp.config("clangd", {
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

-- CSS
vim.lsp.config("cssls", {
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

-- Activate LSPs
vim.api.nvim_create_autocmd({"BufReadPost", "BufNewFile"}, {
  callback = function()
    local bufnr = vim.api.nvim_get_current_buf()
    local filetype = vim.bo[bufnr].filetype
    
    -- LSP will automatically attach based on filetype
    -- No manual intervention needed with modern LSP config
  end,
})

-- Diagnostics config
vim.diagnostic.config({
  virtual_text = false,
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

-- Diagnostics keymaps
vim.keymap.set('n', '<leader>e', function()
  vim.diagnostic.open_float({
    scope = "line",
    border = "rounded",
    max_width = 80,
    source = "always",
  })
end, { desc = "Show detailed diagnostic" })

vim.keymap.set('n', '<leader>q', function()
  vim.diagnostic.setqflist({ open = false, title = "Diagnostics" })
  vim.cmd('copen')
  vim.cmd('wincmd J')
end, { desc = "Show all diagnostics in quickfix" })

-- Configure LSP hover window appearance
vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
  border = "rounded",
  max_width = 80,
  max_height = 20,
  focusable = false, -- Prevents entering the hover window
  silent = true,
  -- Custom highlighting
  style = "minimal",
})

-- Custom highlight groups for prettier hover window
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#2e3440", fg = "#d8dee9" })
vim.api.nvim_set_hl(0, "FloatBorder", { bg = "#2e3440", fg = "#81a1c1" })

vim.keymap.set('n', 'K', vim.lsp.buf.hover, { desc = "Show hover information" })
