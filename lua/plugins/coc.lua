return {
    'neoclide/coc.nvim',
    branch = 'release',
    build = 'npm ci',
    config = function()
        vim.keymap.set('n', 'gd', '<Plug>(coc-definition)', { silent = true })
        vim.keymap.set('n', 'gr', '<Plug>(coc-references)', { silent = true })
        vim.keymap.set('n', 'gi', '<Plug>(coc-implementation)', { silent = true })
        vim.keymap.set('n', 'rn', '<Plug>(coc-rename)', { silent = true })
    end,
}
