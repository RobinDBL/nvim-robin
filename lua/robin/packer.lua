-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  use {
	  'nvim-telescope/telescope.nvim', tag = '0.1.3',
	  -- or                            , branch = '0.1.x',
	  requires = { {'nvim-lua/plenary.nvim'} }
  }
  use({
	  'rose-pine/neovim',
	  as = 'rose-pine',
		config = function()
			vim.cmd('colorscheme rose-pine')
		end
	})
use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
use('nvim-treesitter/playground')
use('ThePrimeagen/harpoon')
use('tpope/vim-fugitive')
use {
  'VonHeikemen/lsp-zero.nvim',
  branch = 'v2.x',
  requires = {
    -- LSP Support
    {'neovim/nvim-lspconfig'},             -- Required
    {'williamboman/mason.nvim'},           -- Optional
    {'williamboman/mason-lspconfig.nvim'}, -- Optional

    -- Autocompletion
    {'hrsh7th/nvim-cmp'},     -- Required
    {'hrsh7th/cmp-nvim-lsp'}, -- Required
    {'L3MON4D3/LuaSnip'},     -- Required
  }
}
use {
    'nvim-tree/nvim-tree.lua',
    requires = {
        { 'nvim-tree/nvim-web-devicons' } --required
    }

}
use('windwp/nvim-autopairs')
use {
    'folke/noice.nvim',
    requires = {
        { 'MunifTanjim/nui.nvim'},
        { 'rcarriga/nvim-notify'},
    }
}
use('charludo/projectmgr.nvim')
use('numTostr/Comment.nvim')
use('voldikss/vim-floaterm')
use('folke/which-key.nvim')
use {
    'CosmicNvim/cosmic-ui',
    { 'MunifTanjim/nui.nvim'}
}
use('xiyaowong/transparent.nvim')

end)
