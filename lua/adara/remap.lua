local keymap = vim.keymap

keymap.set("n", "<leader>pv", "<cmd>Oil<CR>")
keymap.set("t", "<Esc>", "<C-\\><C-n>", { noremap = true })

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
keymap.set({ "v", "n" }, "<C-J>",
  function()
    local m = vim.api.nvim_get_mode()["mode"]
    return m == 'n' and ":.norm! V <CR> :m '>+1<CR>gv=gv" or ":m '>+1<CR>gv=gv"
  end, { expr = true }
) -- moving lines
keymap.set({ "v", "n" }, "<C-K>",
  function()
    local m = vim.api.nvim_get_mode()["mode"]
    return m == 'n' and ".norm! V <CR> :m '<-2<CR>gv=gv" or ":m '<-2<CR>gv=gv"
  end, { expr = true }
) -- moving lines
