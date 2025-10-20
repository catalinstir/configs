return {
  "christoomey/vim-tmux-navigator",
  cmd = {
    "TmuxNavigateLeft",
    "TmuxNavigateDown",
    "TmuxNavigateUp",
    "TmuxNavigateRight",
    "TmuxNavigatePrevious",
    "TmuxNavigatorProcessList",
  },
  keys = {
    { "<C-h>", "<cmd><C-U>TmuxNavigateLeft<CR>", desc = "Tmux Navigate Left" },
    { "<C-j>", "<cmd><C-U>TmuxNavigateDown<CR>", desc = "Tmux Navigate Down" },
    { "<C-k>", "<cmd><C-U>TmuxNavigateUp<CR>", desc = "Tmux Navigate Up" },
    { "<C-l>", "<cmd><C-U>TmuxNavigateRight<CR>", desc = "Tmux Navigate Right" },
    { "<C-\\>", "<cmd><C-U>TmuxNavigatePrevious<CR>", desc = "Tmux Navigate Previous" },
  },
}
