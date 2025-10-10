return {
    "tpope/vim-fugitive",

    config = function()
        vim.keymap.set("n", "<leader>gf", function()
            vim.cmd.Git()
            vim.cmd.wincmd("H")
            vim.api.nvim_win_set_width(0, 40)
        end)
    end
}
