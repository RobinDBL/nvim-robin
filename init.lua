require("config.startup")
require("config.utils")
require("config.remap")
require("config.diagnostics")
require("config.lazy")
require("config.autocomplete") -- must be ran after lazy init


-- require("robin")
-- -- Disable netrw - required for nvim-tree
-- vim.g.loaded_netrw = 1
-- vim.g.loaded_netrwPlugin = 1
-- vim.opt.termguicolors = true
--
-- -- Install lazy if not installed
-- --
-- local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
-- if not vim.loop.fs_stat(lazypath) then
--   vim.fn.system({
--     "git",
--     "clone",
--     "--filter=blob:none",
--     "https://github.com/folke/lazy.nvim.git",
--     "--branch=stable", -- latest stable release
--     lazypath,
--   })
-- end
-- vim.opt.rtp:prepend(lazypath)
--
-- require("lazy").setup("plugins")
