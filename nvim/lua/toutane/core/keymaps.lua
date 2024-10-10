vim.g.mapleader = " "

vim.keymap.set("i", "<C-c>", "<Esc>")

vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("n", "<leader>nh", ":noh<CR>")

-- greatest remap ever according to theprimeagen and asjbornhaland
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])

vim.keymap.set("n", "<leader>oc", "<cmd>e ~/.config/nvim/init.lua<CR>")
