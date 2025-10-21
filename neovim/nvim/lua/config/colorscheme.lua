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
