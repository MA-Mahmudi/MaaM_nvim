return {
    {
        'nvim-telescope/telescope.nvim',
        -- tag = '0.1.8',
        dependencies = {
            'nvim-lua/plenary.nvim',
            { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' }
        },
        config = function()
            require("telescope").setup {
                extensions = {
                    fzf = {}
                },
                pickers = {
                    -- find_files = {
                    --     -- theme = "ivy"
                    -- }
                }
            }
            require("telescope").load_extension("fzf")

            vim.keymap.set("n", "<leader>fd", require("telescope.builtin").find_files)
            vim.keymap.set("n", "<leader>fh", require("telescope.builtin").help_tags)
            vim.keymap.set("n", "<leader>fe", require("telescope.builtin").diagnostics)
            vim.keymap.set("n", "<leader>fr", require("telescope.builtin").resume)
            vim.keymap.set("n", "<leader>fv", require("telescope.builtin").lsp_workspace_symbols)
            vim.keymap.set("n", "<leader>fb", require("telescope.builtin").current_buffer_fuzzy_find, {
                desc = "Find in buffer"
            })
            vim.keymap.set("n", "<leader>fw", require("telescope.builtin").grep_string, {
                desc = "Grep string under cursor"
            })
            vim.keymap.set("n", "<leader>en", function()
                require("telescope.builtin").find_files {
                    cwd = vim.fn.stdpath("config")
                }
            end)
            vim.keymap.set("n", "<leader>ep", function()
                require('telescope.builtin').find_files {
                    cwd = vim.fs.joinpath(tostring(vim.fn.stdpath("data")), "lazy")
                }
            end)

            require "config.telescope.multigrep".setup()
        end
    }
}
