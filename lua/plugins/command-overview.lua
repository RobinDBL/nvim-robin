return {
  "folke/which-key.nvim",
  dependencies = {
    { 'nvim-tree/nvim-web-devicons'},
  },
  config = function()
    local wk = require('which-key')
    wk.add({
      { "<leader>e", group = "show error" },
      { "<leader>g", group = "goto" },
      { "<leader>j", group = "jump" },
      { "<leader>l", group = "lsp" },
      { "<leader>ld", group = "debugger" },
      { "<leader>p", group = "project" },
      { "<leader>ph", group = "harpoon" },
    })
  end,
}
