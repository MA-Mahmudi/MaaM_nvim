return {
  "folke/tokyonight.nvim",
  config = function()
    vim.cmd("colorscheme tokyonight")
    vim.api.nvim_set_hl(0, 'LineNr', { fg = "#ff7373" })
    vim.api.nvim_set_hl(0, 'LineNrAbove', { fg = "#bd5b5b" })
    vim.api.nvim_set_hl(0, 'LineNrBelow', { fg = "#bd5b5b" })
    vim.api.nvim_set_hl(0, 'signColumn', { bg = "none" })
    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
  end
}
