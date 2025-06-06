return {
  "conform.nvim",  

  config = function()
    require("conform").setup({
      formatters_by_ft = {
        lua = { "stylua" },

        c = { "clang_format" }, 
        cpp = { "clang_format" }, 
        
        rust = { "rustfmt", lsp_format = "fallback" },
        
        javascript = { "prettierd", "prettier", stop_after_first = true },
        typescript = { "prettierd", "prettier", stop_after_first = true },
        
        python = { "isort", "black" }, 
      },
    })
  end
}
