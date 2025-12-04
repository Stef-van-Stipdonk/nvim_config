return {
    'nvim-telescope/telescope.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
        local telescope = require('telescope')
        telescope.setup({})
        local builtin = require('telescope.builtin')

        vim.keymap.set('n', '<leader>sf', builtin.find_files, { desc = 'Find files' })
        vim.keymap.set('n', '<leader>sg', builtin.live_grep, { desc = 'Live grep' })
        vim.keymap.set('n', '<leader>sb', builtin.buffers, { desc = 'Find buffers' })
        vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = 'Find help' })
    end,
}
