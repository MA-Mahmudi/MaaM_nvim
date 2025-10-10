return {
    "rcarriga/nvim-notify",
    config = function()
        vim.notify = require("notify")
        require("notify").setup({
            background_colour = "#c8caf7",
            merge_duplicates = true,
        })
    end
}
