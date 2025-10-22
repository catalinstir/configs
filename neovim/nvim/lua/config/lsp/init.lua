-- Mason setup
require("mason").setup()
require("mason-lspconfig").setup({
	ensure_installed = {
		"clangd",
		"rust_analyzer",
		"pyright",
		"ts_ls",
		"lua_ls",
		"cssls",
		"jdtls",
		"omnisharp",
		"texlab",
	},
})

local capabilities = require("cmp_nvim_lsp").default_capabilities()

-- Load language-specific configs
require("config.lsp.clang").setup(capabilities)
require("config.lsp.css").setup(capabilities)
require("config.lsp.omnisharp").setup(capabilities)
require("config.lsp.jdtls").setup(capabilities)
require("config.lsp.general").setup(capabilities)

-- Load UI configs
require("config.lsp.hover")
require("config.lsp.diagnostics")
require("config.lsp.keymaps")

-- Activate LSPs
vim.api.nvim_create_autocmd({ "BufReadPost", "BufNewFile" }, {
	callback = function()
		local bufnr = vim.api.nvim_get_current_buf()
		local filetype = vim.bo[bufnr].filetype

		-- LSP will automatically attach based on filetype
		-- No manual intervention needed with modern LSP config
	end,
})
