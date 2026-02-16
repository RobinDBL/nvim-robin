return {
    "numTostr/Comment.nvim",
    version = "*",
    config = function()
        local comment = require('Comment')

        comment.setup()
    end
}
