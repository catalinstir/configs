local M = {}

function M.setup(capabilities)
	vim.lsp.config("clangd", {
		capabilities = capabilities,
		cmd = {
			"clangd",
			"--log=verbose",
			"--pretty",
			"--enable-config",
			"--clang-tidy",
			"--background-index",
			"--completion-style=detailed",
		},
		settings = {
			clangd = {
				InlayHints = { Enabled = true },
				Diagnostics = {
					EnableCodeActions = true,
					IncludeFixes = true,
					Suppress = false,
				},
			},
		},
	})
end

return M
