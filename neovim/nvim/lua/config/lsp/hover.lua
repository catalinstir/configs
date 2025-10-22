vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
	border = "rounded",
	max_width = 80,
	max_height = 20,
	focusable = false,
	silent = true,
	style = "minimal",
	pad_top = 1,
	pad_bottom = 1,
})

vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
	border = "rounded",
	focusable = false,
	silent = true,
	pad_top = 1,
	pad_bottom = 1,
})

-- Manual hover keymap - press K to show hover
vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Show hover information" })
