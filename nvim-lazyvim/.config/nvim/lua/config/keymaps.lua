-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
-- Define key mappings
local map = vim.api.nvim_set_keymap
local options = { noremap = true, silent = true }

-- Example key mappings
map("n", "<leader>h", ":split<CR>", options)
map("n", "<leader>v", ":vsplit<CR>", options)
