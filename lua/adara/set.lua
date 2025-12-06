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

-- If you want icons for diagnostic errors, you'll need to define them somewhere:
vim.fn.sign_define("DiagnosticSignError", { text = " ", texthl = "DiagnosticSignError" })
vim.fn.sign_define("DiagnosticSignWarn", { text = " ", texthl = "DiagnosticSignWarn" })
vim.fn.sign_define("DiagnosticSignInfo", { text = " ", texthl = "DiagnosticSignInfo" })
vim.fn.sign_define("DiagnosticSignHint", { text = "󰌵", texthl = "DiagnosticSignHint" })

vim.diagnostic.config({
    virtual_text = true, -- This enables inline diagnostics
    update_in_insert = true,
})
