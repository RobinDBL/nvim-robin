local parsers = {
  'blade',
  'angular',
  'html',
  'php',
}

return {
  {
    'nvim-treesitter/nvim-treesitter',
    lazy = false,
    build = ':TSUpdate',
    dependencies = {
      'LiadOz/nvim-dap-repl-highlights',
    },
    opts = {},
    config = function(_, opts)
      local nts = require('nvim-treesitter')

      vim.api.nvim_create_autocmd('FileType', {
        pattern = parsers,
        callback = function()
          vim.treesitter.start()
          vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
          vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
        end,
      })

      vim.api.nvim_create_autocmd('User', {
        pattern = 'TSUpdate',
        callback = function()
          local configs = require('nvim-treesitter.parsers')
        end,
      })

      nts.setup(opts)
      nts.install(parsers)

      vim.keymap.set('n', '<leader>it', vim.treesitter.inspect_tree)
      vim.keymap.set('n', '<leader>i', vim.show_pos)
    end,
  },
  {
    'nvim-treesitter/nvim-treesitter-context',
    opts = {},
  }
}
