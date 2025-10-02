local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  print("lazy.nvim not found at " .. lazypath)
  return
end
vim.opt.rtp:prepend(lazypath)

-- Auto-focus file if opening a file directly with NvimTree enabled
vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    local file = vim.fn.argv(0)
    if file ~= "" then
      -- Schedule switching window focus after NvimTree opens
      vim.schedule(function()
        vim.cmd("wincmd l")
      end)
    end
  end
})

vim.g.neovide_fullscreen = true


require("config")
