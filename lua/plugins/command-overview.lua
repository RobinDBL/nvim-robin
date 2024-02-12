return {
    "folke/which-key.nvim",
    config = function()
        local wk = require('which-key')
        wk.setup({
            window = {
                position = 'bottom',

            },
            layout = {
                align = 'center'
            }
        })
        wk.register({['<leader>'] = {
            j = {
                name = 'jump'
            },
            l = {
                name = 'lsp'
            },
            p = {
                name = 'project'
            }
        }
    })
end
}
