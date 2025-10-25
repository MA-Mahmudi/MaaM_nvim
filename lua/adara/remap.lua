local keymap = vim.keymap

keymap.set("n", "<leader>pv", "<cmd>Oil<CR>")
keymap.set("n", "<leader><leader>", function()
    local cwd = vim.fn.stdpath("config")
    local current = vim.fn.getcwd()
    if string.find(current, cwd) then
        return "<cmd>source %<CR>"
    end
end
)
keymap.set("t", "<Esc>", "<C-\\><C-n>", { noremap = true })
keymap.set("t", "<Esc><Esc>", "<C-\\><C-n><cmd>q<CR>", { noremap = true })
keymap.set("i", "jj", "<C-c>")
keymap.set("i", "kk", "<C-c>")

-- next greatest remap ever: asbjornHaland
keymap.set({ "n", "v" }, "<leader>ys", [["+y]])
keymap.set("n", "<leader>Ys", [["+Y]])

-- next greatest remap ever: K1-end
keymap.set("i", "<C-d>", "<C-o>dw")
keymap.set("n", '<C-l>', ':noh<CR>', { noremap = true, silent = true })
keymap.set("v", "<leader>y", [[mzy`z]])

-- next greatest remap ever: ThePrimeagen
keymap.set("n", "<C-d>", "<C-d>zz")
keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("v", "<C-j>", ":m '>+1<CR>gv=gv") -- moving lines
vim.keymap.set("v", "<C-k>", ":m '<-2<CR>gv=gv") -- moving lines

-- keymap.set({ "v", "n" }, "<C-J>",
--     function()
--         local m = vim.api.nvim_get_mode()["mode"]
--         return m == 'n' and ":.norm! V <CR> :m '>+1<CR>gv=gv" or ":m '>+1<CR>gv=gv"
--     end, { expr = true }
-- ) -- moving lines
-- keymap.set({ "v", "n" }, "<C-K>",
--     function()
--         local m = vim.api.nvim_get_mode()["mode"]
--         return m == 'n' and ".norm! V <CR> :m '<-2<CR>gv=gv" or ":m '<-2<CR>gv=gv"
--     end, { expr = true }
-- ) -- moving lines
