return {
  "nvim-lualine/lualine.nvim",
  {
    "nvim-tree/nvim-tree.lua",
    cmd = "NvimTreeToggle",  -- Lazy-loads the plugin on this command
    config = function()
      require("nvim-tree").setup({
        -- Your custom nvim-tree setup here (if any)
      })
    end,
  },
  "folke/which-key.nvim",
  "numToStr/Comment.nvim",
  "lewis6991/gitsigns.nvim",
  "tpope/vim-fugitive",
  "folke/noice.nvim",
  "lukas-reineke/indent-blankline.nvim",
  "windwp/nvim-ts-autotag",
}

