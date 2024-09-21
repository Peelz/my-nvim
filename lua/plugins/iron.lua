return {
  "Vigemus/iron.nvim",
  opts = {},
  config = function()
    local iron = require("iron.core")
    iron.setup({

      config = {
        -- Whether a repl should be discarded or not
        scratch_repl = true,
        -- Your repl definitions come here
        repl_definition = {
          sh = {
            -- Can be a table or a function that
            -- returns a table (see below)
            command = { "zsh" },
          },
          python = {
            command = { "python3" }, -- or { "ipython", "--no-autoindent" }
            format = require("iron.fts.common").bracketed_paste_python,
          },
        },
        -- How the repl window will be displayed
        -- See below for more information
        repl_open_cmd = require("iron.view").bottom(40),
      },
    })
  end,
  keys = {
    { "<space>rs", "<cmd>IronRepl<cr>", desc = "IronRepl", mode = "n" },
    { "<space>rr", "<cmd>IronRestart<cr>", desc = "IronRestart", mode = "n" },
    { "<space>rf", "<cmd>IronFocus<cr>", desc = "IronFocus", mode = "n" },
    { "<space>rh", "<cmd>IronHide<cr>", desc = "IronHide", mode = "n" },
  },
}
