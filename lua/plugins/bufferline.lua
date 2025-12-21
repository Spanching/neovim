return {
  'akinsho/bufferline.nvim',
  version = "*",
  dependencies = 'nvim-tree/nvim-web-devicons',
  after = "catppuccin",
  config = function()
    vim.opt.termguicolors = true
    require('bufferline').setup({
      options = {
        mode = 'buffers',
        separator_style = 'slant',
        -- diagnostics = "nvim_lsp",
        offsets = {
          { filetype = 'NvimTree' }
        },
      },
      highlights = require('catppuccin.special.bufferline').get_theme({
        styles = { "bold" },
        custom = {
          all = {
            -- fill = { bg = "#292c3c" },
            buffer_selected = {
              -- italic = false
            },
          },
        }
      })
    })
  end
}
