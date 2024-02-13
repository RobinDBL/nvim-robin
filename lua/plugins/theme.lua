return {
    {
    'rose-pine/neovim',
    name = 'rose-pine',
    lazy = false,
    config = function()
        vim.cmd('colorscheme rose-pine')
        end
    },
    {
        "xiyaowong/transparent.nvim"
    },
    {
        'CosmicNvim/cosmic-ui',
        dependencies = { 'MunifTanjim/nui.nvim', 'nvim-lua/plenary.nvim'},
        config = function()
            local ui = require('cosmic-ui')

            ui.setup();
        end
    },
    {
        'folke/tokyonight.nvim'
    },
    {
        'tiagovla/tokyodark.nvim'
    }

}
