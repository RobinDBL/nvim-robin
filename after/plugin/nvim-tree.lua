require('nvim-tree').setup()

vim.keymap.set("n", "<leader>pv", vim.cmd.NvimTreeOpen, { desc = 'open tree view'})
vim.keymap.set("n", "<leader>pq", vim.cmd.NvimTreeClose, { desc = 'close tree view'})
