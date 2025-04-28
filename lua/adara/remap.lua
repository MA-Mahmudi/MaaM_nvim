local keymap = vim.keymap

keymap.set("n", "<leader>pv", "<cmd>Ex<CR>")
keymap.set("t", "<Esc>", "<C-\\><C-n>", { noremap = true })

-- next greatest remap ever: asbjornHaland
keymap.set({ "n", "v" }, "<leader>ys", [["+y]])
keymap.set("n", "<leader>Ys", [["+Y]])

-- next greatest remap ever: K1-end
keymap.set("v", "<leader>y", [[mzy`z]])
keymap.set("i", "<C-d>", "<C-o>dw")
keymap.set('n', '<C-l>', ':noh<CR>', { noremap = true, silent = true })

keymap.set("n", "<C-d>", "<C-d>zz")
keymap.set("n", "<C-u>", "<C-u>zz")
