vim.g.mapleader = " "
vim.g.maplocalleader = " "

require("config.lazy") -- plugin setup
require("config.options") -- basic settings
require("config.keymaps") -- key bindings
require("config.lsp")
require("config.colorscheme")
