return {
  'VonHeikemen/lsp-zero.nvim',
  branch = 'v4.x',
  dependencies = {
    {'neovim/nvim-lspconfig'},
    {'hrsh7th/cmp-nvim-lsp'}, -- autocomplete
    {'hrsh7th/nvim-cmp'}, -- autocomplete
    {'williamboman/mason.nvim'},           -- auto configure lsp
    {'williamboman/mason-lspconfig.nvim'}, -- auto configure lsp
    {'L3MON4D3/LuaSnip'},     -- autocomplete
    {'aznhe21/actions-preview.nvim'}, -- code actions
  },
  -- configuration
  config = function()
    local lsp_zero = require('lsp-zero')

    local lsp_attach = function(client, bufnr)
      local opts = {buffer = bufnr}
    end

    lsp_zero.extend_lspconfig({
      sign_text = true,
      lsp_attach = lsp_attach,
      capabilities = require('cmp_nvim_lsp').default_capabilities(),
    })


    lsp_zero.setup({})

    require('mason').setup({})
    require('mason-lspconfig').setup({
      -- Replace the language servers listed here 
      -- with the ones you want to install
      ensure_installed = {
        'lua_ls',
        'tsserver',
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
    })

    -- autocomplete
    local cmp = require('cmp')

    cmp.setup({
      sources = {
        {name = 'nvim_lsp'},
      },
      snippet = {
        expand = function(args)
          require('luasnip').lsp_expand(args.body)
        end,
      },
      mapping = cmp.mapping.preset.insert({
        -- use `enter` to select autocompletion
        ['<CR>'] = cmp.mapping.confirm({select = false}),

        -- use `ctrl + space` to trigger autocomplete list
        ['<C-Space>'] = cmp.mapping.complete(),
      }),
    })

    -- Keymaps
    -- Definition
    vim.keymap.set("n", "<leader>gd", ':lua vim.lsp.buf.definition()<CR>', { desc = 'Go to definition'})
    vim.keymap.set("n", "<leader>gD", ':lua vim.lsp.buf.declaration()<CR>', { desc = 'Go to declaration'})
    vim.keymap.set("n", "<leader>gi", ':lua vim.lsp.buf.implementation()<CR>', { desc = 'Go to implementation'})
    vim.keymap.set('n', 'gt', ':lua vim.lsp.buf.type_definition()<CR>', { desc = 'Go to type definition' })
    vim.keymap.set('n', 'gr', ':lua vim.lsp.buf.references()<CR>', { desc = 'Go to reference' })

    -- diagnostics
    vim.keymap.set('n', '[g', ':lua vim.diagnostic.goto_prev()<CR>', { desc = 'Prev diagnostic' })
    vim.keymap.set('n', ']g', ':lua vim.diagnostic.goto_next()<CR>', { desc = 'Next diagnostic' })
    vim.keymap.set('n','ge',':lua vim.diagnostic.open_float(nil, { scope = "line", })<CR>', { desc = 'Show current line diagnostic' })

    -- hover
    vim.keymap.set('n', 'K', ':lua vim.lsp.buf.hover()<CR>', { desc = 'Show documentation' })

    -- inlay hints
    vim.keymap.set('n', '<leader>lh', ':lua vim.lsp.buf.inlay_hint()<CR>', { desc = 'Toggle inlay hints for buffer' })

    -- code actions
    -- vim.keymap.set('n', '<leader>la', ':lua vim.lsp.buf.code_action()<CR>', { desc = 'Code Actions' })
    -- vim.keymap.set('n', '<leader>la', ':lua require("cosmic-ui").code_actions()<CR>', { desc = 'Code Actions' })
    vim.keymap.set('n', '<leader>la', ':lua require("actions-preview").code_actions()<CR>', { desc = 'Code Actions' })

    vim.keymap.set('n', '<leader>lr', ':lua vim.lsp.buf.rename()<CR>', { desc = 'Code Actions' })
  end
}
