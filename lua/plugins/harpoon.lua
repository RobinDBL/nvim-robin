return {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-telescope/telescope.nvim"
    },
    config = function ()
        local harpoon = require("harpoon")
        harpoon:setup({})

        local conf = require('telescope.config').values
        local function toggle_telescope(harpoon_files)
            local file_paths = {}
            for _, item in ipairs(harpoon_files.items) do
                table.insert(file_paths, item.value)
            end

            require("telescope.pickers").new({}, {
                prompt_title = "Harpoon",
                finder = require("telescope.finders").new_table({
                    results = file_paths,
                }),
                previewer = conf.file_previewer({}),
                sorter = conf.generic_sorter({}),
            }):find()
        end


        -- vim.keymap.set('n', '<leader>phs', function() toggle_telescope(harpoon:list()) end, { desc = 'Toggle harpoon list with telescope ui' })
        vim.keymap.set('n', '<leader>phs', function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, { desc = 'Toggle harpoon list' })
        vim.keymap.set('n', '<leader>pha', function() harpoon:list():append() end, { desc = 'Add file to harpoon list' })
        vim.keymap.set('n', '<leader>phd', function() harpoon:list():remove() end, { desc = 'remove file to harpoon list' })
        vim.keymap.set('n', '<leader>phh', function() harpoon:list():select(1) end, { desc = 'Select harpoon file 1' })
        vim.keymap.set('n', '<leader>phj', function() harpoon:list():select(2) end, { desc = 'Select harpoon file 2' })
        vim.keymap.set('n', '<leader>phk', function() harpoon:list():select(3) end, { desc = 'Select harpoon file 3' })
        vim.keymap.set('n', '<leader>phl', function() harpoon:list():select(4) end, { desc = 'Select harpoon file 4' })
    end
}
