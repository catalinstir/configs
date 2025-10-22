return {
	"nvim-lualine/lualine.nvim",
	{ "nvim-tree/nvim-web-devicons", opts = {} },
	"folke/which-key.nvim",
	"numToStr/Comment.nvim",
	"lewis6991/gitsigns.nvim",
	"tpope/vim-fugitive",
	"folke/noice.nvim",
	"rcarriga/nvim-notify", -- Add nvim-notify to fix the noice warning
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		---@module "ibl"
		---@type ibl.config
		opts = {},
	},
	"windwp/nvim-ts-autotag",
}
