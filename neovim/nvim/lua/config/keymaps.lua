vim.keymap.set("n", "<leader>tt", ":Neotree toggle<CR>", { desc = "Toggle Neo-tree" })
vim.keymap.set("n", "<leader>tf", ":Neotree focus<CR>", { desc = "Focus Neo-tree" })
vim.keymap.set("n", "<leader>ff", ":Telescope find_files<CR>")
vim.keymap.set("n", "<leader>fg", ":Telescope live_grep<CR>")

vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.keymap.set("n", ";", ":", { noremap = true })
vim.keymap.set("n", ":", ";", { noremap = true })
vim.api.nvim_set_keymap("n", "!", ":!", { noremap = true, silent = true })

-- Terminal mode keymaps
vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]], { noremap = true, silent = true })
vim.keymap.set("t", "<C-h>", [[<C-\><C-n><C-w>h]], { noremap = true, silent = true })
vim.keymap.set("t", "<C-j>", [[<C-\><C-n><C-w>j]], { noremap = true, silent = true })
vim.keymap.set("t", "<C-k>", [[<C-\><C-n><C-w>k]], { noremap = true, silent = true })
vim.keymap.set("t", "<C-l>", [[<C-\><C-n><C-w>l]], { noremap = true, silent = true })
vim.keymap.set("n", "<C-S-h>", "<C-w>H", {
	noremap = true,
	silent = true,
	desc = "Move window to far left",
})

vim.keymap.set("n", "<C-S-j>", "<C-w>J", {
	noremap = true,
	silent = true,
	desc = "Move window to very bottom",
})

vim.keymap.set("n", "<C-S-k>", "<C-w>K", {
	noremap = true,
	silent = true,
	desc = "Move window to very top",
})

vim.keymap.set("n", "<C-S-l>", "<C-w>L", {
	noremap = true,
	silent = true,
	desc = "Move window to far right",
})

vim.keymap.set("n", "<leader>km", "<cmd>Telescope keymaps<cr>", { desc = "Keymap Search" })
vim.keymap.set(
	"n",
	"<leader>a",
	"ggVG",
	{ noremap = true, silent = true, desc = "Select entire buffer from normal mode" }
)
vim.keymap.set(
	"v",
	"<leader>a",
	"<Esc>ggVG",
	{ noremap = true, silent = true, desc = "Select entire buffer from visual mode" }
)
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
		desc = "Go to tab " .. i .. " (terminal)",
	})
end

vim.api.nvim_create_user_command("Tn", "tabnew", {})

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
vim.keymap.set("n", "<Tab>", "gt", { desc = "Next tab" })
vim.keymap.set("n", "<S-Tab>", "gT", { desc = "Previous tab" })
vim.keymap.set("n", "<leader>td", ":tab split<CR>", { desc = "Duplicate current tab" })
vim.keymap.set("n", "<leader>te", function()
	vim.cmd("botright 10split")
	vim.cmd("terminal")
	vim.cmd("startinsert")
end, { noremap = true, silent = true, desc = "Open terminal below" })
