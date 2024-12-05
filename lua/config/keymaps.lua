-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local map = LazyVim.safe_keymap_set

vim.keymap.del("n", "<S-h>")
vim.keymap.del("n", "<S-l>")

map("n", "<S-m>", "<cmd>bprevious<cr>", { desc = "Prev Buffer" })
map("n", "m", "<cmd>bnext<cr>", { desc = "Next Buffer" })
map("n", "t", "<cmd>e #<cr>", { desc = "Switch to Other Buffer" })
map("n", "qq", function()
  Snacks.bufdelete()
end, { desc = "Delete Buffer" })

map("n", "(", "g;", { desc = "older position in change list" })
map("n", ")", "g,", { desc = "newer position in change list" })

-- diagnostic
local diagnostic_goto = function(next, severity)
  local go = next and vim.diagnostic.goto_next or vim.diagnostic.goto_prev
  severity = severity and vim.diagnostic.severity[severity] or nil
  return function()
    go({ severity = severity })
  end
end
map("n", "<leader>j", diagnostic_goto(true, "ERROR"), { desc = "Next Error" })
map("n", "<leader>k", diagnostic_goto(false, "ERROR"), { desc = "Prev Error" })
