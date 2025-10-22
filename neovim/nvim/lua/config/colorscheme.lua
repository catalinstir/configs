local schemes = {
	"catppuccin",
	"kanagawa-dragon",
	"catppuccin-mocha",
	"catppuccin-macchiato",
	"kanagawa",
}

math.randomseed(os.time() * math.random(1, 10000))
math.random()
math.random()
math.random()

local chosen = schemes[math.random(#schemes)]
-- vim.cmd.colorscheme(chosen)
vim.cmd.colorscheme("kanagawa")

-- hover info color override
vim.schedule(function()
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#1e1e2e", fg = "#cdd6f4" })
	vim.api.nvim_set_hl(0, "FloatBorder", { bg = "#1e1e2e", fg = "#89b4fa", bold = true })
	vim.api.nvim_set_hl(0, "FloatTitle", { bg = "#1e1e2e", fg = "#89b4fa", bold = true })
end)
