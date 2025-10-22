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
		vim.keymap.set("n", "j", "<Down>", opts)
		vim.keymap.set("n", "k", "<Up>", opts)
		vim.keymap.set("n", "<CR>", "<CR>", opts)
		vim.keymap.set("n", "q", ":cclose<CR>", opts)
	end,
	desc = "Set quickfix keymappings",
})

-- Diagnostics keymaps
vim.keymap.set("n", "<leader>e", function()
	vim.diagnostic.open_float({
		scope = "line",
		border = "rounded",
		max_width = 80,
		source = "always",
	})
end, { desc = "Show detailed diagnostic" })

vim.keymap.set("n", "<leader>q", function()
	vim.diagnostic.setqflist({ open = false, title = "Diagnostics" })
	vim.cmd("copen")
	vim.cmd("wincmd J")
end, { desc = "Show all diagnostics in quickfix" })
