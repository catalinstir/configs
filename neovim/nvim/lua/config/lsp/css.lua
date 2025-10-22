local M = {}

function M.setup(capabilities)
	vim.lsp.config("cssls", {
		capabilities = capabilities,
		settings = {
			css = {
				validate = true,
				lint = {
					unknownAtRules = "ignore",
				},
			},
			scss = {
				validate = true,
				lint = {
					unknownAtRules = "ignore",
				},
			},
			less = {
				validate = true,
				lint = {
					unknownAtRules = "ignore",
				},
			},
		},
		on_init = function(client)
			client.server_capabilities.workspace = {
				diagnostics = false,
			}
			return true
		end,
	})
end

return M
