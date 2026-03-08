local config = {
  "NickvanDyke/opencode.nvim",
  dependencies = {
    {
      -- `snacks.nvim` integration is recommended, but optional
      ---@module "snacks" <- Loads `snacks.nvim` types for configuration intellisense
      "folke/snacks.nvim",
      optional = true,
      opts = {
        input = {}, -- Enhances `ask()`
        picker = { -- Enhances `select()`
          actions = {
            opencode_send = function(...)
              return require("opencode").snacks_picker_send(...)
            end,
          },
          win = {
            input = {
              keys = {
                ["<a-a>"] = { "opencode_send", mode = { "n", "i" } },
              },
            },
          },
        },
      },
    },
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
      "<M-.>",
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
      "<M-S-p>",
      function()
        require("opencode").command("session.half.page.up")
      end,
      mode = { "n", "t" },
      desc = "Scroll opencode up",
    },
    {
      "<M-S-n>",
      function()
        require("opencode").command("session.half.page.down")
      end,
      mode = { "n", "t" },
      desc = "Scroll opencode down",
    },
    { "+", "<C-a>", desc = "Increment under cursor", noremap = true },
    { "-", "<C-x>", desc = "Decrement under cursor", noremap = true },
  },
}

return config
