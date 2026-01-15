return {
  'mason-org/mason-lspconfig.nvim',
  dependencies = {
  { "mason-org/mason.nvim", opts = {} },
  "neovim/nvim-lspconfig",
  {'hrsh7th/cmp-nvim-lsp'}, -- autocomplete
  {'hrsh7th/nvim-cmp'}, -- autocomplete
  {'L3MON4D3/LuaSnip'},     -- autocomplete
  {'aznhe21/actions-preview.nvim'}, -- code actions
  },
  opts = {
      ensure_installed = {
        'lua_ls',
        'eslint',
        'rust_analyzer',
        'angularls',
        'html'
      },
      handlers = {
        function(server_name)
          require('lspconfig')[server_name].setup({})
        end,

        angularls = function ()
          --local default_node_modules = vim.fn.getcwd() .. "/node_modules"
          local default_node_modules = '/usr/local/lib/node_modules/@angular/language-server'
          local default_typescript_server = '/usr/local/lib/node_modules/typescript-language-server'

          local ngls_cmd = {
            "ngserver",
            "--stdio",
            "--tsProbeLocations",
            default_node_modules,
            "--ngProbeLocations",
            default_node_modules,
          }


          require'lspconfig'.angularls.setup({
            cmd = ngls_cmd,
            on_new_config = function(new_config)
              new_config.cmd = ngls_cmd
            end,
            on_attach = on_attach,
            on_attach = capabilities,
          })
        end
      },
    }
  }
