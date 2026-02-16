return {
    "windwp/nvim-autopairs",
    version = "*",
    config = function()
        local ap = require('nvim-autopairs')

        ap.setup()
    end
}
