return {
  "NickvanDyke/opencode.nvim",
  dependencies = {
    -- Recommended for `ask()` and `select()`.
    -- Required for `snacks` provider.
    ---@module 'snacks' <- Loads `snacks.nvim` types for configuration intellisense.
    { "folke/snacks.nvim", opts = { input = {}, picker = {}, terminal = {} } },
  },
  config = function(_, opts) end,
  opts = {
    autoread = true,
    provider = {
      enabled = "snacks",
      tmux = {},
      wezterm = {},
      snacks = {},
      terminal = {},
    },
  },
  keys = {
    {
      "<M-a>a",
      function()
        require("opencode").ask()
      end,
      mode = { "n", "x" },
      desc = "Ask opencode",
    },
    {
      "<M-a>b",
      function()
        require("opencode").ask("@buffer: ")
      end,
      mode = { "n", "x" },
      desc = "Ask current buffer",
    },
    {
      "<M-a>o",
      function()
        require("opencode").ask("@this: ", { submit = true })
      end,
      mode = { "n", "x" },
      desc = "Ask @this opencode…",
    },
    {
      "<M-a>c",
      function()
        require("opencode").command("prompt.clear")
      end,
      mode = { "n", "x" },
      desc = "Execute opencode action…",
    },
    {
      "<M-a>x",
      function()
        require("opencode").select()
      end,
      mode = { "n", "x" },
      desc = "Execute opencode action…",
    },
    {
      "<C-.>",
      function()
        require("opencode").toggle()
      end,
      mode = { "n", "t" },
      desc = "Toggle opencode",
    },
    {
      "<M-a>.",
      function()
        require("opencode").toggle()
      end,
      mode = { "n", "t" },
      desc = "Toggle opencode",
    },
    {
      "<M-a>r",
      function()
        return require("opencode").operator("@this ")
      end,
      mode = { "n", "x" },
      desc = "Add range to opencode",
      expr = true,
    },
    {
      "<M-a>l",
      function()
        return require("opencode").operator("@this ") .. "_"
      end,
      desc = "Add line to opencode",
      expr = true,
    },
    {
      "<M-a>u",
      function()
        require("opencode").command("session.half.page.up")
      end,
      desc = "Scroll opencode up",
    },
    {
      "<M-a>d",
      function()
        require("opencode").command("session.half.page.down")
      end,
      desc = "Scroll opencode down",
    },
    { "+", "<C-a>", desc = "Increment under cursor", noremap = true },
    { "-", "<C-x>", desc = "Decrement under cursor", noremap = true },
  },
}
