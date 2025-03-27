require("config.lazy")
require("lazy").setup("plugins")

local keymap = vim.keymap
local opt = vim.opt

vim.g.mapleader = " " --leader is space

opt.colorcolumn = "0"
opt.scrolloff = 8

keymap.set("n", "<leader>pv", "<cmd>Ex<CR>")
keymap.set("n", "<leader><leader>", function()
  vim.cmd("so")
end)
