return {
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    dependencies = {
      { "zbirenbaum/copilot.lua" },
      { "nvim-lua/plenary.nvim" },
    },
    opts = {

   },
    -- See Commands section for default commands if you want to lazy load on them
    config = function()
      require('CopilotChat').setup({
        debug = true,
      })
      vim.keymap.set("n", "<leader>cct", function()
        require('CopilotChat').toggle({
          window = {
            layout = 'float',
            title = 'Copilot Chat',
          },
          auto_insert_mode = true,
          insert_at_end = true,
        })
      end)
      vim.keymap.set("n", "<leader>cce", function()
        require('CopilotChat').ask("Explain how it works.", {
          window = {
            layout = 'float',
            title = 'Copilot Chat',
          },
          auto_insert_mode = true,
          insert_at_end = true,
          selection = require("CopilotChat.select").buffer,
        })
      end)
    end
  },
}
