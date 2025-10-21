return {
  "stevearc/conform.nvim",  

  config = function()
    require("conform").setup({
      formatters_by_ft = {
        lua = { "stylua" },

        c = { "clang_format" }, 
        cpp = { "clang_format" }, 
        
        rust = { "rustfmt", lsp_format = "fallback" },
        
        -- Remove prettierd since it's not installed, use only prettier
        javascript = { "prettier" },
        typescript = { "prettier" },
        
        python = { "isort", "black" }, 
      },
    })

    -- Add keymap for formatting
    vim.keymap.set({ "n", "v" }, "<leader>fm", function()
      require("conform").format({
        lsp_fallback = true,
        async = false,
        timeout_ms = 1000,
      })
    end, { desc = "Format file or range" })

    -- Optional: Format on save
    -- Uncomment the lines below if you want automatic formatting on save
    vim.api.nvim_create_autocmd("BufWritePre", {
      pattern = "*",
      callback = function(args)
        require("conform").format({ bufnr = args.buf })
      end,
    })
  end
}
