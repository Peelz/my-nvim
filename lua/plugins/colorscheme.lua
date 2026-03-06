return {
  {
    "catppuccin/nvim",
    lazy = true,
    name = "catppuccin",
    opts = {
      flavour = "mocha",
      integrations = { blink_cmp = true },
      transparent_background = true,
    },
  },
  {
    "folke/tokyonight.nvim",
    lazy = true,
    opts = {
      style = "moon",
      transparent = true,
      styles = {
        sidebars = "transparent",
        floats = "transparent",
      },
    },
  },
  {
    "sainnhe/everforest",
    opts = {
      background = "soft",
      enable_italic = true,
      show_eob = true,
      diagnostic_text_highlight = true,
    },
  },
  {
    "sainnhe/gruvbox-material",
    opts = {
      background = "soft",
    },
  },
  { "ellisonleao/gruvbox.nvim" },
  {
    "LazyVim/LazyVim",
    opts = {
      -- colorscheme = "gruvbox",
      -- colorscheme = "everforest",
      -- colorscheme = "catppuccin",
      colorscheme = "tokyonight",
    },
  },
}
