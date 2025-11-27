return {
  "nvim-tree/nvim-tree.lua",
  dependencies = {
    "nvim-tree/nvim-web-devicons", -- OPTIONAL: for file icons
  },
  version = '1.1.5',
  config = function()
    -- disable netrw at the very start of your init.lua
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1

    -- set termguicolors to enable highlight groups
    vim.opt.termguicolors = true

    local function my_on_attach(bufnr)
      local api = require("nvim-tree.api")

      local function opts(desc)
        return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
      end

      -- default mappings
      api.config.mappings.default_on_attach(bufnr)

      -- custom mappings
      vim.keymap.set("n", "<leader>|", api.node.open.vertical, opts("Open vertical split"))
      vim.keymap.set("n", "<leader>-", api.node.open.tab_drop, opts("Open horizontal split"))
      vim.keymap.set("n", "?", api.tree.toggle_help, opts("Help"))
    end

    require("nvim-tree").setup({
      actions = {
        open_file = {
          quit_on_open = true,
        },
      },
      update_focused_file = {
        enable = true,
      },
      sort_by = "case_sensitive",
      view = {
        width = 60,
      },
      renderer = {
        group_empty = true,
      },
      filters = {
        dotfiles = false,
      },
      on_attach = my_on_attach,
    })

    vim.keymap.set("n", "<leader>ee", vim.cmd.NvimTreeToggle)
    vim.keymap.set("n", "<leader>ef", vim.cmd.NvimTreeFocus)
  end
}
