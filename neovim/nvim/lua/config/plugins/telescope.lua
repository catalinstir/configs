return {
	"nvim-telescope/telescope.nvim",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		local actions = require("telescope.actions")

		require("telescope").setup({
			defaults = {
				mappings = {
					i = {
						["<C-j>"] = actions.move_selection_next,
						["<C-k>"] = actions.move_selection_previous,
					},
				},
				file_ignore_patterns = {
					"node_modules",
					".git/",
					"dist/",
					"build/",
					"target/",
				},
			},
			pickers = {
				find_files = {
					hidden = true,
					no_ignore = false,
					-- Open files to the right if only Neo-tree is open
					attach_mappings = function(_, map)
						actions.select_default:replace(function(prompt_bufnr)
							local action_state = require("telescope.actions.state")
							local entry = action_state.get_selected_entry()
							actions.close(prompt_bufnr)

							-- Check if only Neo-tree window exists
							local wins = vim.api.nvim_list_wins()
							local normal_wins = 0
							for _, win in ipairs(wins) do
								local buf = vim.api.nvim_win_get_buf(win)
								local ft = vim.bo[buf].filetype
								if ft ~= "neo-tree" then
									normal_wins = normal_wins + 1
								end
							end

							-- If only Neo-tree exists, create a vertical split
							if normal_wins == 0 then
								vim.cmd("wincmd l") -- Move to the right
								vim.cmd("vsplit")
							end

							vim.cmd("edit " .. entry.path)
						end)
						return true
					end,
				},
			},
		})
	end,
}
