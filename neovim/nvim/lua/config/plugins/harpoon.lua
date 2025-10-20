return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = { "nvim-lua/plenary.nvim" },

  config = function()
    local harpoon = require("harpoon")

    harpoon:setup()

    -- Basic Harpoon keymaps
    vim.keymap.set("n", "<leader>ha", function() harpoon:list():add() end,
      { desc = "Harpoon add file" })

    vim.keymap.set("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end,
      { desc = "Harpoon menu" })

    -- Quick file selects
    vim.keymap.set("n", "<leader>1", function() harpoon:list():select(1) end)
    vim.keymap.set("n", "<leader>2", function() harpoon:list():select(2) end)
    vim.keymap.set("n", "<leader>3", function() harpoon:list():select(3) end)
    vim.keymap.set("n", "<leader>4", function() harpoon:list():select(4) end)

    -- Cycle Harpoon files
    vim.keymap.set("n", "<leader>hn", function() harpoon:list():next() end,
      { desc = "Next Harpoon file" })
    vim.keymap.set("n", "<leader>hp", function() harpoon:list():prev() end,
      { desc = "Prev Harpoon file" })
  end,
}

