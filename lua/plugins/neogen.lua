return {
  "danymat/neogen",
  dependencies = { "nvim-treesitter/nvim-treesitter" },
  config = function()
        vim.keymap.set("n", "<leader>ng", function()
          require("neogen").generate()
        end, { desc = "Generate documentation" })

    require("neogen").setup({
      enabled = true,
      languages = {
        c = {
          template = {
            annotation_convention = "doxygen",
          },
        },
        cpp = {
          template = {
            annotation_convention = "doxygen",
          },
        },
      },
    })
  end,
}
