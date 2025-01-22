require("config.lazy")
require("lazy").setup("plugins")

local keymap = vim.keymap

vim.g.mapleader = " " --leader is space

keymap.set("n", "<leader>pv", "<cmd>Ex<CR>")
vim.keymap.set("n", "<leader><leader>", function()
  vim.cmd("so")
end)
