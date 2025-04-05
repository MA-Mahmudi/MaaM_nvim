require("config.lazy")
require("lazy").setup("plugins")
require("adara")

local opt = vim.opt

vim.g.mapleader = " " --leader is space

opt.colorcolumn = "0"
opt.scrolloff = 8
opt.updatetime = 100
