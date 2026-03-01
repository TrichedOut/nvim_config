-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.del("n", "s")
vim.keymap.del("n", "S")

local wk = require "which-key"
wk.add({
  { "<leader><tab><tab>", "<cmd>tabnew<CR>", desc = "New Tab" },
  { "H", "<cmd>tabprev<CR>", desc = "Previous Tab" },
  { "L", "<cmd>tabnext<CR>", desc = "Next Tab" },
  { "<leader><tab>d", "<cmd>tabclose<CR>", desc = "Previous Tab" },
})
