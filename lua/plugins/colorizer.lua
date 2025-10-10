return {
  {
    "norcalli/nvim-colorizer.lua",
    config = function()
      require('colorizer').setup({
        '*', -- Apply to all file types
      })
    end
  }
}
