return {
    {
        'nvim-telescope/telescope.nvim', tag = '0.1.5',
        dependencies = { 'nvim-lua/plenary.nvim' },
        config = function ()
            local builtin = require('telescope.builtin')
            vim.keymap.set('n', '<leader>pf', builtin.git_files, { desc = 'open git files'})
            vim.keymap.set('n', '<C-p>', builtin.find_files, { desc = 'open files'})
            vim.keymap.set('n', '<leader>ps', function()
                builtin.grep_string({ search = vim.fn.input("Grep > ")});
            end, { desc = 'find string in project'})
        end
    },
}
