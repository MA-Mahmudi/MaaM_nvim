return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
  },
  keys = {
    {
      "<leader>?",
      function()
        require("which-key").show({ global = false })
      end,
      desc = "Buffer Local Keymaps (which-key)",
    },
  },
  config = function()
    local wk = require("which-key")
    wk.add({
      { "<leader>f",  group = "File" },
      { "<leader>fd", desc = "Find files" },
      { "<leader>fh", desc = "Find help tags" },
      { "<leader>fg", desc = "Live multi grep" },
      { "<leader>p",  group = "Ex" },
      { "<leader>pv", desc = "Explore" },
      { "<leader>h",  group = "Harpoon" },
      { "<leader>hq", desc = "Add buffer" },
      { "<leader>ha", desc = "Select buffer 1" },
      { "<leader>hs", desc = "Select buffer 2" },
      { "<leader>hd", desc = "Select buffer 3" },
      { "<leader>hf", desc = "Select buffer 4" },
      { "<leader>hg", desc = "Show buffers list" },
    })
  end
}
