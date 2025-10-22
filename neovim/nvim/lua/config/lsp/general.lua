local M = {}

function M.setup(capabilities)
	-- General LSP servers with default config
	local servers = { "rust_analyzer", "pyright", "ts_ls", "lua_ls", "texlab" }

	for _, server in ipairs(servers) do
		vim.lsp.config(server, {
			capabilities = capabilities,
		})
	end
end

return M
