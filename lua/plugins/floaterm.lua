return {
    "voldikss/vim-floaterm",
    config = function()
        vim.keymap.set("n", "<leader>ft", "<cmd>FloatermToggle<CR>")
    end
}
