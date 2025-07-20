vim.keymap.set("n", "<leader>t", ":NvimTreeToggle<CR>")
vim.keymap.set("n", "<leader>ff", ":Telescope find_files<CR>")
vim.keymap.set("n", "<leader>fg", ":Telescope live_grep<CR>")

vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.keymap.set('n', ';', ':', { noremap = true })
vim.keymap.set('n', ':', ';', { noremap = true })

vim.keymap.set('t', '<Esc>', [[<C-\><C-n>]], { noremap = true, silent = true })


 
vim.keymap.set("n", "<leader>km", "<cmd>Telescope keymaps<cr>", { desc = "Keymap Search" })
vim.keymap.set("n", "<leader>a", "ggVG", { noremap = true, silent = true, desc = "Select entire buffer from normal mode" })
vim.keymap.set("v", "<leader>a", "<Esc>ggVG", { noremap = true, silent = true, desc = "Select entire buffer from visual mode" })
vim.keymap.set({ "n", "v" }, "<leader>y", '"+y', { noremap = true, desc = "Yank to clipboard" })
vim.keymap.set({ "n", "v" }, "<leader>d", '"+d', { noremap = true, desc = "Delete to clipboard" })
vim.keymap.set({ "n", "v" }, "<leader>p", '"+p', { noremap = true, desc = "Paste from clipboard" })
vim.keymap.set({ "n", "v" }, "<leader>P", '"+P', { noremap = true, desc = "Paste from clipboard above" })


vim.api.nvim_set_keymap('n', '!', ':!', { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<Leader>1', '1gt', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>2', '2gt', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>3', '3gt', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>4', '4gt', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>5', '5gt', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>6', '6gt', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>7', '7gt', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>8', '8gt', { noremap = true, silent = true })

vim.api.nvim_create_user_command('Tn', 'tabnew', {})

-- WINDOW RESIZE
-- vertically 
vim.keymap.set("n", "<leader><", ":vertical resize -2<CR>", { noremap = true, silent = true, desc = "Resize window narrower" })
vim.keymap.set("n", "<leader>>", ":vertical resize +2<CR>", { noremap = true, silent = true, desc = "Resize window wider" })

-- horizontally
vim.keymap.set("n", "<leader>-", ":resize -2<CR>", { noremap = true, silent = true, desc = "Resize window shorter" })
vim.keymap.set("n", "<leader>+", ":resize +2<CR>", { noremap = true, silent = true, desc = "Resize window taller" })

