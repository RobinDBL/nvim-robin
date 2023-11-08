local lsp = require('lsp-zero')

lsp.preset('recommended')

lsp.ensure_installed(
	'tsserver',
	'eslint',
	'sumneko_lua',
	'rust_analyzer'
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
