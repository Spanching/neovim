return {
  "williamboman/mason.nvim",
  "neovim/nvim-lspconfig",
  "hrsh7th/cmp-nvim-lsp-signature-help",
  {
    "hrsh7th/cmp-nvim-lsp",
    config = function()
      local servers = { "pyright", "lua_ls", "marksman", "json_ls", "nil_ls" }

      require("mason").setup()

      vim.lsp.config.lua_ls = {
        cmd = { 'lua-language-server' },
        filetypes = { 'lua' },
        settings = {
          Lua = {
            workspace = {
              library = vim.api.nvim_get_runtime_file("", true),
            }
          },
        },
      }

      vim.lsp.config.json_ls = {
        cmd = { '/etc/profiles/per-user/andreas/bin/vscode-json-language-server', '--stdio' },
        filetypes = { 'json', 'jsonc' },
        -- settings = {
        --   json = {
        --     validate = { enable = true },
        --   },
        -- },
        capabilities = {
          textDocument = {
            completion = {
              completionItem = {
                snippetSupport = true
              }
            }
          }
        },
        handlers = {
          ['workspace/diagnostic/refresh'] = function() end,
        }
      }

      vim.lsp.config.nil_ls = {
        cmd = { 'nil' },
        filetypes = { 'nix' },
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
