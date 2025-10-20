vim.keymap.set("n", "<leader>tt", ":NvimTreeToggle<CR>")
vim.keymap.set("n", "<leader>ff", ":Telescope find_files<CR>")
vim.keymap.set("n", "<leader>fg", ":Telescope live_grep<CR>")

vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.keymap.set('n', ';', ':', { noremap = true })
vim.keymap.set('n', ':', ';', { noremap = true })
vim.api.nvim_set_keymap('n', '!', ':!', { noremap = true, silent = true })

vim.keymap.set('t', '<Esc>', [[<C-\><C-n>]], { noremap = true, silent = true })


 
vim.keymap.set("n", "<leader>km", "<cmd>Telescope keymaps<cr>", { desc = "Keymap Search" })
vim.keymap.set("n", "<leader>a", "ggVG", { noremap = true, silent = true, desc = "Select entire buffer from normal mode" })
vim.keymap.set("v", "<leader>a", "<Esc>ggVG", { noremap = true, silent = true, desc = "Select entire buffer from visual mode" })
vim.keymap.set({ "n", "v" }, "<leader>y", '"+y', { noremap = true, desc = "Yank to clipboard" })
vim.keymap.set({ "n", "v" }, "<leader>d", '"+d', { noremap = true, desc = "Delete to clipboard" })
vim.keymap.set({ "n", "v" }, "<leader>p", '"+p', { noremap = true, desc = "Paste from clipboard" })
vim.keymap.set({ "n", "v" }, "<leader>P", '"+P', { noremap = true, desc = "Paste from clipboard above" })

-- Alt+Tab# behavior
for i = 1, 9 do
  -- normal mode Alt+Tab#
  vim.keymap.set("n", "<M-" .. i .. ">", i .. "gt", { noremap = true, silent = true, desc = "Go to tab " .. i })

  -- terminal mode Alt+Tab#
  vim.keymap.set("t", "<M-" .. i .. ">", [[<C-\><C-n>]] .. i .. "gt", {
      noremap = true,
      silent = true,
      desc = "Go to tab " .. i .. " (terminal)"
  })
end

vim.api.nvim_create_user_command('Tn', 'tabnew', {})

vim.keymap.set("n", "<C-Tab>", function()
  local current = vim.fn.tabpagenr()
  if current > 1 then
    vim.cmd("tabmove " .. (current - 2))
  end
end, { desc = "Swap with previous tab" })

-- fast tab management
vim.keymap.set("n", "<leader>tn", ":tabnew<CR>", { desc = "New tab" })
vim.keymap.set("n", "<leader>tc", ":tabclose<CR>", { desc = "Close tab" })
vim.keymap.set("n", "<leader>to", ":tabonly<CR>", { desc = "Close all other tabs" })
vim.keymap.set("n", "<leader>tl", ":tabmove +1<CR>", { desc = "Move tab right" })
vim.keymap.set("n", "<leader>th", ":tabmove -1<CR>", { desc = "Move tab left" })
vim.keymap.set("n", "<Tab>", "gt", { desc = "Next tab" })
vim.keymap.set("n", "<S-Tab>", "gT", { desc = "Previous tab" })
vim.keymap.set("n", "<leader>td", ":tab split<CR>", { desc = "Duplicate current tab" })
vim.keymap.set("n", "<leader>te", function()
  vim.cmd("tabnew | terminal")
end, { noremap = true, silent = true, desc = "Open terminal in new tab" })

