return {
    "voldikss/vim-floaterm",
    config = function()
        vim.keymap.set('n', '<C-l>', ':FloatermToggle<CR>', {desc = 'Toggle terminal'})
        vim.keymap.set('t', '<C-l>', [[<C-\><C-n>]], {desc = 'Close Floaterm'})
        vim.keymap.set('t', '<C-w>l', [[<C-\><C-n>:FloatermNext<CR>]], { desc = 'Next terminal' })
        vim.keymap.set('t', '<C-w>h', [[<C-\><C-n>:FloatermPrev<CR>]], { desc = 'Prev terminal' })
        vim.keymap.set('t', '<C-w>n', [[<C-\><C-n>:FloatermNew<CR>]], { desc = 'New terminal' })
        vim.keymap.set('t', '<C-w>c', [[<C-\><C-n>:FloatermKill<CR>]], { desc = 'Kill current terminal' })
    end
}
