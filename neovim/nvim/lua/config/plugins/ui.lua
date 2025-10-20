return {
  "nvim-lualine/lualine.nvim",
  {
    "nvim-tree/nvim-tree.lua",
    cmd = "NvimTreeToggle",
    config = function()
      require("nvim-tree").setup({
        view = {
          width = 25,
          side = "left",
        },
        renderer = {
          highlight_git = true,
          highlight_opened_files = "none",
        },
        filters = {
          dotfiles = false,
        },
        git = {
          enable = true,
        },
      })
    end,
  },
  { "nvim-tree/nvim-web-devicons", opts = {} },
  "folke/which-key.nvim",
  "numToStr/Comment.nvim",
  "lewis6991/gitsigns.nvim",
  "tpope/vim-fugitive",
  "folke/noice.nvim",
  {
      "lukas-reineke/indent-blankline.nvim",
      main = "ibl",
      ---@module "ibl"
      ---@type ibl.config
      opts = {},
  },
  "windwp/nvim-ts-autotag",
}

