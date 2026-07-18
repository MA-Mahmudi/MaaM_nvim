return {
    "tpope/vim-fugitive",

    config = function()
        vim.keymap.set("n", "<leader>gf", function()
            vim.cmd.Git()
        end)
    end
}
