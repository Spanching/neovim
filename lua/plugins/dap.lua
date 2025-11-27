return {
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "rcarriga/nvim-dap-ui",
      "nvim-neotest/nvim-nio"
    },
    config = function()
      local dap = require('dap')
      local dapui = require("dapui")
      dapui.setup()
      dap.listeners.before.attach.dapui_config = function()
        dapui.open()
      end
      dap.listeners.before.launch.dapui_config = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated.dapui_config = function()
        dapui.close()
      end
      dap.listeners.before.event_exited.dapui_config = function()
        dapui.close()
      end
      vim.fn.sign_define('DapBreakpoint', { text = '', texthl = '', linehl = '', numhl = '' })
      vim.fn.sign_define('DapStopped', { text = '▶️', texthl = '', linehl = '', numhl = '' })

      vim.keymap.set('n', '<F5>', function() dap.continue() end)
      vim.keymap.set('n', '<F6>', function() dap.step_over() end)
      vim.keymap.set('n', '<F7>', function() dap.step_into() end)
      vim.keymap.set('n', '<F8>', function() dap.step_out() end)
      vim.keymap.set('n', '<Leader>db', function() dap.toggle_breakpoint() end)
      vim.keymap.set('n', '<Leader>dr', function() dap.repl.open() end)
      vim.keymap.set('n', '<Leader>dl', function() dap.run_last() end)
      vim.keymap.set('n', '<Leader>dx', function() dap.terminate() end)
      vim.keymap.set('n', '<Leader>da', function() dap.restart() end)
      vim.keymap.set('n', '<leader>dc', function() dapui.close() end)
      vim.keymap.set('n', '<leader>do', function() dapui.open() end)
      vim.keymap.set({ 'n', 'v' }, '<Leader>dh', function()
        require('dap.ui.widgets').hover()
      end)
      vim.keymap.set({ 'n', 'v' }, '<Leader>dp', function()
        require('dap.ui.widgets').preview()
      end)
      vim.keymap.set('n', '<Leader>df', function()
        local widgets = require('dap.ui.widgets')
        widgets.centered_float(widgets.frames)
      end)
      vim.keymap.set('n', '<Leader>ds', function()
        local widgets = require('dap.ui.widgets')
        widgets.centered_float(widgets.scopes)
      end)
    end
  },
}
