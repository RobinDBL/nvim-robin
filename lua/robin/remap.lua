vim.g.mapleader = " "


vim.keymap.set("n", "<leader>e", ':lua vim.diagnostic.open_float()<CR>')
vim.keymap.set('n', '<leader>j', '', { desc = 'Jump' })
vim.keymap.set('n', '<leader>je', '$', { desc = 'Jump to last character of line' })
vim.keymap.set('n', '<leader>jb', '^', { desc = 'Jump to first character of line' })
vim.keymap.set('n', '<leader>jE', '<end>', { desc = 'Jump to end of line' })
vim.keymap.set('n', '<leader>jB', '<home>', { desc = 'Jump to end of line' })
vim.keymap.set('n', '<leader>fr', ':lua vim.lsp.buf.rename()<CR>', { desc = 'Rename element'})
vim.keymap.set('i', '<A-j>', '<esc>', { desc = 'exit mode'})
vim.keymap.set('n', '<A-j>', ':move +1<CR>', { desc = 'Move line down 1'})
vim.keymap.set('n', '<A-k>', ':move -2<CR>', { desc = 'Move line up 1'})
