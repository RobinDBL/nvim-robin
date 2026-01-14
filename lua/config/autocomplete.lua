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
