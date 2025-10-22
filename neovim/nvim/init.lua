local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	print("lazy.nvim not found at " .. lazypath)
	return
end
vim.opt.rtp:prepend(lazypath)

vim.g.neovide_fullscreen = true

require("config")
