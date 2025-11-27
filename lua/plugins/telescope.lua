return {
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.2",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      vim.api.nvim_create_autocmd("FileType", {
        pattern = "TelescopeResults",
        callback = function(ctx)
          vim.api.nvim_buf_call(ctx.buf, function()
            vim.fn.matchadd("TelescopeParent", "\t\t.*$")
            vim.api.nvim_set_hl(0, "TelescopeParent", { link = "Comment" })
          end)
        end,
      })

      local function filenameOnly(_, path)
        local tail = vim.fs.basename(path)
        return string.format("%s", tail)
      end
      local function filenameFirst(_, path)
        local tail = vim.fs.basename(path)
        local parent = vim.fs.dirname(path)
        if parent == "." then return tail end
        return string.format("%s\t\t%s", tail, parent)
      end
      require('telescope').setup({
        path_display = filenameFirst,
        defaults = {
          layout_config = {
            horizontal = {
              width = 0.9,
              height = 0.9,
            },
            vertical = {
              width = 0.5,
              height = 0.8,
            },
          },
          layout_strategy = 'vertical',
          mappings = {
            i = {
              ["<C-k>"] = "move_selection_next",
              ["<C-j>"] = "move_selection_previous",
            },
          }
        },
        pickers = {
          lsp_definitions = {
            path_display = filenameFirst,
            theme = "dropdown",
            initial_mode = "normal",
          },
          lsp_references = {
            path_display = filenameFirst,
            theme = "dropdown",
            initial_mode = "normal",
          },
          lsp_implementations = {
            path_display = filenameFirst,
            theme = "dropdown",
            initial_mode = "normal",
          },
          help_tags = {
            previewer = false,
            theme = "dropdown",
          },
          live_grep = {
            path_display = filenameFirst,
            theme = "dropdown",
          },
          git_files = {
            path_display = filenameFirst,
            theme = "dropdown",
          },
          grep_string = {
            path_display = filenameFirst,
            theme = "dropdown",
            initial_mode = "normal",
          },
          find_files = {
            path_display = filenameFirst,
            theme = "dropdown",
          },
          buffers = {
            path_display = filenameFirst,
            theme = "dropdown",
            initial_mode = "normal",
          },
        }
      })
      local function grep_visual(telescope_fn, opts)
        return function()
          local text = table.concat(vim.fn.getregion(vim.fn.getpos('v'), vim.fn.getpos('.')), ' ')
          telescope_fn(vim.tbl_extend('force', opts or {}, { default_text = text }))
        end
      end
      local function grep_word(telescope_fn, opts)
        return function()
          local text = vim.fn.expand("<cword>")
          telescope_fn(vim.tbl_extend('force', opts or {}, { default_text = text }))
        end
      end
      local function grep_WORD(telescope_fn, opts)
        return function()
          local text = vim.fn.expand("<cWORD>")
          telescope_fn(vim.tbl_extend('force', opts or {}, { default_text = text }))
        end
      end

      local builtin = require("telescope.builtin")

      vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
      vim.keymap.set("n", "<leader>fr", builtin.git_files, {})
      vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
      vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
      vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})
      vim.keymap.set("n", "<leader>fs", builtin.grep_string, {})

      vim.keymap.set("v", "<leader>ff", grep_visual(builtin.find_files))
      vim.keymap.set("v", "<leader>fr", grep_visual(builtin.git_files))
      vim.keymap.set("v", "<leader>fg", grep_visual(builtin.live_grep))
      vim.keymap.set("v", "<leader>fb", grep_visual(builtin.buffers))
      vim.keymap.set("v", "<leader>fh", grep_visual(builtin.help_tags))
      vim.keymap.set("v", "<leader>fs", grep_visual(builtin.grep_string))

      vim.keymap.set("n", "<leader>Ff", grep_word(builtin.find_files))
      vim.keymap.set("n", "<leader>Fr", grep_word(builtin.git_files))
      vim.keymap.set("n", "<leader>Fg", grep_word(builtin.live_grep))
      vim.keymap.set("n", "<leader>Fb", grep_word(builtin.buffers))
      vim.keymap.set("n", "<leader>Fh", grep_word(builtin.help_tags))
      vim.keymap.set("n", "<leader>Fs", grep_word(builtin.grep_string))

      vim.keymap.set("n", "<leader>FF", grep_WORD(builtin.find_files))
      vim.keymap.set("n", "<leader>FR", grep_WORD(builtin.git_files))
      vim.keymap.set("n", "<leader>FG", grep_WORD(builtin.live_grep))
      vim.keymap.set("n", "<leader>FB", grep_WORD(builtin.buffers))
      vim.keymap.set("n", "<leader>FH", grep_WORD(builtin.help_tags))
      vim.keymap.set("n", "<leader>FS", grep_WORD(builtin.grep_string))

      vim.keymap.set("n", "gd", builtin.lsp_definitions, {})
      vim.keymap.set("n", "gr", builtin.lsp_references, {})
      vim.keymap.set("n", "gI", builtin.lsp_implementations, {})
    end
  },
  -- {
  --     'nvim-telescope/telescope-ui-select.nvim'
  -- }
}
