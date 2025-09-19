return {
    'stevearc/oil.nvim',
    opts = {},
    dependencies = { "nvim-tree/nvim-web-devicons" },
    keys = {
        { "<leader><leader>", "<cmd>Oil<cr>", desc = "Oil" },
    },
    config = function()
        require("oil").setup({
        view_options = {
            show_hidden = true,
            is_always_hidden = function(name, _)
                return name == '..'
            end,
        },
    })
    end,
}
