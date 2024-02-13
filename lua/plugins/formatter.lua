return {
	"mhartington/formatter.nvim",
	config = function()
		-- Utilities for creating configurations
		local util = require("formatter.util")
		local defaults = require("formatter.defaults")

		-- Provides the Format, FormatWrite, FormatLock, and FormatWriteLock commands
		require("formatter").setup({
			-- Enable or disable logging
			logging = true,
			-- Set the log level
			log_level = vim.log.levels.WARN,
			-- All formatter configurations are opt-in
			filetype = {
				-- Formatter configurations for filetype "lua" go here
				-- and will be executed in order
				lua = {
					-- "formatter.filetypes.lua" defines default configurations for the
					-- "lua" filetype
					require("formatter.filetypes.lua").stylua,
				},
				javascript = {
					require("formatter.filetypes.javascript").prettier,
				},
				typescript = {
					require("formatter.filetypes.typescript").prettier,
				},
				rust = {
					require("formatter.filetypes.rust"),
				},
				-- Use the special "*" filetype for defining formatter configurations on
				-- any filetype
				["*"] = {
					-- "formatter.filetypes.any" defines default configurations for any
					-- filetype
					require("formatter.filetypes.any").remove_trailing_whitespace,
				},
			},
		})
		-- Add keybinds to manually format
		vim.keymap.set("n", "<leader>lp", ":Format<CR>", { desc = "Run Formatter (don't save)" })
		vim.keymap.set("n", "<leader>lP", ":FormatWrite<CR>", { desc = "Run Formatter (save)" })
		-- Add format on save

		-- local augroup = vim.api.nvim_create_augroup
		-- local autocmd = vim.api.nvim_create_autocmd
		-- augroup("__formatter__", { clear = true })
		-- autocmd("BufWritePost", {
		--     group = "__formatter__",
		--     command = ":FormatWrite",
		-- })
	end,
}
