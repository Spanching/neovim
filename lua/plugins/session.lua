return {
  "natecraddock/sessions.nvim",
  config = function()
    require("sessions").setup({
      events = { "VimLeavePre" },
      session_filepath = "/home/andreas/.nvim_session",
      absolute = true,
    })

    vim.keymap.set("n", "<leader>ps", function () require("sessions").save(nil, {}) end)
    vim.keymap.set("n", "<leader>pl", function () require("sessions").load(nil, {}) end)
  end
}
