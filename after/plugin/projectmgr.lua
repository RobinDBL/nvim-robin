local projectManager = require('projectmgr')

projectManager.setup({
    reopen = true,
    session = { enabled = true, file = "Session.vim"},
    shada = { enabled = false, file = "main.shada"},

    scripts = {
        enabled = false,
    }
})


vim.keymap.set("n", "<leader>po", vim.cmd.ProjectMgr, {desc = 'open project'})
