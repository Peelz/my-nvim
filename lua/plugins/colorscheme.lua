return {
  {
    "catppuccin/nvim",
    lazy = true,
    name = "catppuccin",
    opts = {
      flavour = "macchiato",
      integrations = { blink_cmp = true },
    },
  },
  {
    "folke/tokyonight.nvim",
    lazy = true,
    opts = {
      style = "storm",
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
