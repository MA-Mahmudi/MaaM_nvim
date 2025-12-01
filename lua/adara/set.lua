local opt = vim.opt

vim.g.mapleader = " " --leader is space

opt.colorcolumn = "0"
opt.scrolloff = 8
opt.updatetime = 100
opt.number = true
opt.relativenumber = true
opt.termguicolors = true
opt.tabstop = 4      -- tab size
opt.softtabstop = 4  -- how many tabs to insert when pressing tab
opt.shiftwidth = 4   -- auto-indentation
opt.expandtab = true -- replace tabs with spaces
opt.breakindent = true
-- vim.o.updatetime = 100
