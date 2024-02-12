return {
    "folke/trouble.nvim",
    dependencies = {
        { 'nvim-tree/nvim-web-devicons' } --required
    },
    config = function()
        local trouble = require("trouble")
        vim.keymap.set('n', '<leader>lf', function() trouble.toggle("quickfix") end, {desc = 'Toggle quickfix'})
        vim.keymap.set('n', '<leader>le', function() trouble.toggle() end, {desc = 'Toggle trouble errors'})
    end
}
