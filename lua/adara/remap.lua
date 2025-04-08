local keymap = vim.keymap

keymap.set("n", "<leader>pv", "<cmd>Ex<CR>")
keymap.set("t", "<Esc>", "<C-\\><C-n>", { noremap = true })

-- next greatest remap ever : asbjornHaland
keymap.set({ "n", "v" }, "<leader>y", [["+y]])
keymap.set("n", "<leader>Y", [["+Y]])

keymap.set("n", "<C-d>", "<C-d>zz")
keymap.set("n", "<C-u>", "<C-u>zz")
