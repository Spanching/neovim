return {
  {
    "tadmccorkle/markdown.nvim",
    ft = "markdown",
    opts = {},
    config = function()
      require("markdown").setup({})

      vim.keymap.set("n", "<leader>tt", vim.cmd.MDTaskToggle)
    end
  },
  {
    'MeanderingProgrammer/render-markdown.nvim',
    dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-mini/mini.nvim' },
    opts = {
      preset = 'none'
    },
  }
}
