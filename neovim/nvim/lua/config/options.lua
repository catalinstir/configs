vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.wrap = true -- Enable line wrapping
vim.opt.linebreak = true -- Break lines at word boundaries
vim.opt.breakindent = true -- Maintain indentation for wrapped lines
vim.opt.showbreak = "↪ " -- Show this symbol at the start of wrapped lines
vim.opt.termguicolors = true
vim.opt.signcolumn = "yes"

-- Auto-enter insert mode when switching to terminal
vim.api.nvim_create_autocmd({ "BufEnter", "WinEnter" }, {
	pattern = "term://*",
	callback = function()
		vim.cmd("startinsert")
	end,
})

-- Neovide-specific settings
if vim.g.neovide then
	-- Floating window shadow settings
	vim.g.neovide_floating_shadow = true
	vim.g.neovide_floating_z_height = 10
	vim.g.neovide_light_angle_degrees = 45
	vim.g.neovide_light_radius = 5

	-- Other useful Neovide settings
	vim.g.neovide_opacity = 0.90
	vim.g.neovide_scroll_animation_length = 0.15
	vim.g.neovide_cursor_animation_length = 0.06
	vim.g.neovide_cursor_trail_size = 0.3
end
