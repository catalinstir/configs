return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000, -- Load this before all other plugins
  config = function()
    require("catppuccin").setup({
      flavour = "macchiato", -- latte, frappe, macchiato, mocha
      background = {
        light = "latte",
        dark = "mocha",
      },
      integrations = {
        treesitter = true,
        native_lsp = {
          enabled = true,
          virtual_text = {
            errors = { "italic" },
            hints = { "italic" },
            warnings = { "italic" },
            information = { "italic" },
          },
          underlines = {
            errors = { "underline" },
            hints = { "underline" },
            warnings = { "underline" },
            information = { "underline" },
          },
        },
        cmp = true,
        gitsigns = true,
        telescope = true,
        nvimtree = true,
        which_key = true,
        indent_blankline = { enabled = true },
      },
    })

    vim.cmd.colorscheme("catppuccin")
  end,
}
