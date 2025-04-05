return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local harpoon = require("harpoon")
    local keymap = vim.keymap

    harpoon:setup()

    keymap.set("n", "<leader>hq", function() harpoon:list():add() end)
    keymap.set("n", "<leader>hg", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)
    keymap.set("n", "<leader>ha", function() harpoon:list():select(1) end)
    keymap.set("n", "<leader>hs", function() harpoon:list():select(2) end)
    keymap.set("n", "<leader>hd", function() harpoon:list():select(3) end)
    keymap.set("n", "<leader>hf", function() harpoon:list():select(4) end)
  end
}
