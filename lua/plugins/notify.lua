return {
    "rcarriga/nvim-notify",
    config = function()
        require("notify").setup({
            background_colour = "#c8caf7",
            merge_duplicates = true,
        })
    end
}
