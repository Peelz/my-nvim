return {
  {
    "catppuccin/nvim",
    lazy = true,
    name = "catppuccin",
    opts = {
      flavour = "macchiato",
    },
    specs = {
      {
        "akinsho/bufferline.nvim",
        optional = true,
        opts = function(_, opts)
          if (vim.g.colors_name or ""):find("catppuccin") then
            opts.highlights = require("catppuccin.groups.integrations.bufferline").get()
          end
        end,
      },
    },
  },
  {
    "folke/tokyonight.nvim",
    lazy = true,
    opts = {
      style = "storm",
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
