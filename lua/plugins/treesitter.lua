return {
    'nvim-treesitter/nvim-treesitter',
    build = ":TSUpdate",
    opts = {
        ensure_installed = { "lua", "c", "cpp" },
        refactor = {
            smart_rename = {
                enable = true,
            },
        },
    },
    config = function(_, opts)
        require("nvim-treesitter.configs").setup(opts)
    end,
}
