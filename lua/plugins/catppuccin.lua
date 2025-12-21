return {
  {
    "catppuccin/nvim",
    lazy = false,
    name = "catppuccin",
    priority = 1000,
    config = function()
      require('catppuccin').setup({
        flavour = "frappe",
        integrations = {
          notify = true,
        },
        auto_integrations = true,
      })
      vim.cmd.colorscheme "catppuccin-frappe"
    end
  }
}
