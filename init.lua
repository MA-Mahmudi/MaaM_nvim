require("config.lazy")
require("lazy").setup("plugins")

local keymap = vim.keymap

vim.g.mapleader = " " --leader is space

keymap.set("n", "<leader>pv", "<cmd>Ex<CR>")
keymap.set("n", "<leader><leader>", function()
  vim.cmd("so")
end)
keymap.set("t", "<Esc>", "<C-\\><C-n>", { noremap = true })
