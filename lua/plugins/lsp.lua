return {
  "williamboman/mason.nvim",
  "neovim/nvim-lspconfig",
  "hrsh7th/cmp-nvim-lsp-signature-help",
  {
    "hrsh7th/cmp-nvim-lsp",
    config = function()
      local servers = { "pyright", "lua_ls", "marksman", "jsonls", "nixd" }

      require("mason").setup()

      vim.lsp.config.lua_ls = {
        settings = {
          Lua = {
            diagnostics = {
              -- globals = { "vim", "require" },
            },
            workspace = {
              library = vim.api.nvim_get_runtime_file("", true),
            }
          },
        },
      }

      vim.lsp.config.nixd = {
        settings = {
          nixd = {
            formatting = {
              command = { "nixfmt" }
            },
          },
        },
      }

      vim.lsp.enable(servers)

      -- LSP attach
      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("UserLspConfig", {}),
        callback = function(ev)
          -- Buffer local mappings.
          local opts = { buffer = ev.buf }
          vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
          vim.keymap.set("n", "<C-s>", vim.lsp.buf.signature_help, opts)
          vim.keymap.set("n", "<leader>D", vim.lsp.buf.type_definition, opts)
          vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
          vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)
          vim.keymap.set({ "n" }, "<leader>fmf", vim.lsp.buf.format, opts)
        end,
      })
    end
  },

}
