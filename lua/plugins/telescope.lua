if true then
  return {}
end

local actions = require("telescope.actions")

return {
  "nvim-telescope/telescope.nvim",
  keys = {
    {
      "<leader>m",
      "<cmd>Telescope buffers sort_mru=true sort_lastused=true<cr>",
      desc = "Switch Buffer",
    },
  },
  opts = {
    defaults = {
      mappings = {
        i = {
          ["<C-j>"] = actions.move_selection_next,
          ["<C-k>"] = actions.move_selection_previous,
        },
      },
    },
  },
}
