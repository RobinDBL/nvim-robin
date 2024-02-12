return {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v2.x',
    dependencies = {
        -- LSP Support
        {'neovim/nvim-lspconfig'},             -- Required
        {'williamboman/mason.nvim'},           -- Optional
        {'williamboman/mason-lspconfig.nvim'}, -- Optional

        -- Autocompletion
        {'hrsh7th/nvim-cmp'},     -- Required
        {'hrsh7th/cmp-nvim-lsp'}, -- Required
        {'L3MON4D3/LuaSnip'},     -- Required
    },
    config = function()
        local lsp = require('lsp-zero')

        lsp.preset('recommended')

        lsp.ensure_installed(
        'tsserver',
        'eslint',
        'sumneko_lua',
        'rust_analyzer',
        'angularls',
        'html'
        )

        lsp.nvim_workspace()

        -- Autocompletion
        local cmp = require('cmp')
        local cmp_mappings = lsp.defaults.cmp_mappings({
            -- use `enter` to select autocompletion
            ['<CR>'] = cmp.mapping.confirm({select = false}),

            -- use `ctrl + space` to trigger autocomplete list
            ['<C-Space>'] = cmp.mapping.complete(),
        })

        lsp.setup_nvim_cmp({
            mapping = cmp_mappings,
            preselect = 'item',
            completion = {
                completeopt = 'menu,menuone,noinsert'
            }
        })

        lsp.setup()

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

        vim.keymap.set("n", "<leader>gd", ':lua vim.lsp.buf.definition()<CR>', { desc = 'Go to definition'})
        vim.keymap.set("n", "<leader>gD", ':lua vim.lsp.buf.declaration()<CR>', { desc = 'Go to declaration'})
        vim.keymap.set("n", "<leader>gi", ':lua vim.lsp.buf.implementation()<CR>', { desc = 'Go to implementation'})
        vim.keymap.set('n', 'gt', ':lua vim.lsp.buf.type_definition()<CR>', { desc = 'Go to type definition' })
        vim.keymap.set('n', 'gr', ':lua vim.lsp.buf.references()<CR>', { desc = 'Go to reference' })

        -- diagnostics
        vim.keymap.set('n', '[g', ':lua vim.diagnostic.goto_prev()<CR>', { desc = 'Prev diagnostic' })
        vim.keymap.set('n', ']g', ':lua vim.diagnostic.goto_next()<CR>', { desc = 'Next diagnostic' })
        vim.keymap.set(
        'n',
        'ge',
        ':lua vim.diagnostic.open_float(nil, { scope = "line", })<CR>',
        { desc = 'Show current line diagnostic' }
        )

        -- hover
        vim.keymap.set('n', 'K', ':lua vim.lsp.buf.hover()<CR>', { desc = 'Show documentation' })

        -- inlay hints
        vim.keymap.set('n', '<leader>lh', ':lua vim.lsp.buf.inlay_hint()<CR>', { desc = 'Toggle inlay hints for buffer' })

        -- code actions
        -- vim.keymap.set('n', '<leader>la', ':lua vim.lsp.buf.code_action()<CR>', { desc = 'Code Actions' })
        vim.keymap.set('n', '<leader>la', ':lua require("cosmic-ui").code_actions()<CR>', { desc = 'Code Actions' })

        vim.keymap.set('n', '<leader>lr', ':lua vim.lsp.buf.rename()<CR>', { desc = 'Code Actions' })
    end
}
