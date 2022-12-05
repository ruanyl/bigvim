require("nvim-tree").setup({
  filters = {
    dotfiles = true,
  },
  git = {
    ignore = false,
  },
  renderer = {
    icons = {
      glyphs = {
        git = {
          unstaged = "+",
          staged = "✓",
          unmerged = "",
          renamed = "➜",
          untracked = "?",
          deleted = "",
          ignored = "◌",
        }
      }
    }
  }
})
