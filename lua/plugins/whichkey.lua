return
{
  "folke/which-key.nvim",
  event = "VeryLazy",
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 300
  end,
  config = function()
    local wk = require("which-key")
    wk.add({
      { "<leader>g",   group = "Git" },    -- Group declaration
      { "<leader>gh",  group = "Hunk" },   -- Group declaration
      { "<leader>gb",  group = "Buffer" }, -- Group declaration
      { "<leader>gt",  group = "Toggle" }, -- Group declaration

      { "<leader>f",   group = "find" },   -- Group declaration
      { "<leader><",   desc = "Move Tab Left" },
      { "<leader>>",   desc = "Move Tab Right" },
      { "<leader>nh",  desc = "No highlighting" },
      { "<leader>u",   desc = "Undo Tree" },
      { "<leader>w",   desc = "Write file" },
      { "<leader>D",   desc = "Type definition" },
      { "<leader>q",   desc = "Quit" },
      { "<leader>rn",  desc = "Rename Symbol" },
      { "<leader>s",   desc = "Leap forward" },
      { "<leader>S",   desc = "Leap backward" },

      -- Find group
      { "<leader>ff",  desc = "Find File" },
      { "<leader>fg",  desc = "Grep all files" },
      { "<leader>fb",  desc = "Find Buffer" },
      { "<leader>fh",  desc = "Find in Help" },
      { "<leader>fr",  desc = "Find in Repository" },

      -- Format group
      { "<leader>fm",  group = "Format" },
      { "<leader>fmf", desc = "Format File" },

      -- Explorer group
      { "<leader>e",   group = "Explorer" },
      { "<leader>ee",  desc = "Toggle Explorer" },
      { "<leader>ef",  desc = "Focus Explorer" },

      -- Buffer group
      { "<leader>b",   group = "Buffer" },
      { "<leader>bn",  desc = "Buffer Next" },
      { "<leader>bp",  desc = "Buffer Previous" },
      { "<leader>bc",  desc = "Buffer Close" },
      { "<leader>be",  desc = "Buffermanager Quick Menu" },

      -- Line group
      { "<leader>l",   group = "Line" },
      { "<leader>ld",  desc = "Duplicate" },
      { "<leader>lj",  desc = "Move Down" },
      { "<leader>lk",  desc = "Move Up" },

      -- Debug group
      { "<leader>d",   group = "Debug" },
      { "<leader>dm",  desc = "Main Class Configs" },
      { "<leader>db",  desc = "Breakpoint" },
      { "<leader>dr",  desc = "Open REPL" },
      { "<leader>dl",  desc = "Run Last" },
      { "<leader>dx",  desc = "Terminate" },
      { "<leader>da",  desc = "Restart (Again)" },
      { "<leader>dh",  desc = "Hover" },
      { "<leader>dp",  desc = "Preview" },
      { "<leader>df",  desc = "Frames" },
      { "<leader>ds",  desc = "Scope" },
      { "<leader>dc",  desc = "Close Dap UI" },

      -- Copilot group
      { "<leader>c",   group = "Copilot" },
      { "<leader>ca",  desc = "Code action" },
      { "<leader>cp",  desc = "Open Copilot Panel" },
      { "<leader>cc",  desc = "Copilot Chat" },

      -- Harpoon group
      { "<leader>h",   group = "Harpoon" },
      { "<leader>ha",  desc = "Append File" },
      { "<leader>hr",  desc = "Remove File" },
      { "<leader>he",  desc = "Quick Menu (Explorer)" },
      { "<leader>hh",  desc = "Select 1" },
      { "<leader>hj",  desc = "Select 2" },
      { "<leader>hk",  desc = "Select 3" },
      { "<leader>hl",  desc = "Select 4" },
      { "<leader>hp",  desc = "Previous" },
      { "<leader>hn",  desc = "Next" },

      -- Test group
      { "<leader>t",   group = "Test" },
      { "<leader>tc",  desc = "Test Class" },
      { "<leader>tm",  desc = "Test Method" },
      { "<leader>ts",  desc = "Goto Subjects" },

      -- Method group
      { "<leader>m",   group = "Method" },
      { "<leader>mn",  desc = "Next" },
      { "<leader>mp",  desc = "Previous" },

      -- Find with Selection group
      { "<leader>F",   group = "Find with Selection" },
      { "<leader>Ff",  desc = "Find word in File" },
      { "<leader>Fg",  desc = "Grep word in all files" },
      { "<leader>Fb",  desc = "Find word in Buffer" },
      { "<leader>Fh",  desc = "Find word in in Help" },
      { "<leader>Fr",  desc = "Find word in in Repository" },
      { "<leader>FF",  desc = "Find Word in File" },
      { "<leader>FG",  desc = "Grep Word in all files" },
      { "<leader>FB",  desc = "Find Word in Buffer" },
      { "<leader>FH",  desc = "Find Word in in Help" },
      { "<leader>FR",  desc = "Find Word in in Repository" },
    }
    )
  end
}
