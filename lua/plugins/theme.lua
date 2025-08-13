return {
  "ellisonleao/gruvbox.nvim",
  -- "morhetz/gruvbox",
  config = function()
    vim.cmd("colorscheme gruvbox")
    vim.api.nvim_set_hl(0, "LineNr", { fg = "#ff7373" })
    vim.api.nvim_set_hl(0, "LineNrAbove", { fg = "#805957" })
    vim.api.nvim_set_hl(0, "LineNrBelow", { fg = "#805957" })
    vim.api.nvim_set_hl(0, "signColumn", { bg = "none" })
    -- vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    -- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
  end
}
