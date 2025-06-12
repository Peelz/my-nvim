return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        denols = {
          root_dir = require("lspconfig.util").root_pattern("deno.json", "deno.jsonc"),
          init_options = {
            lint = true,
            unstable = true,
          },
        },
        -- Optional: disable tsserver in deno projects
        tsserver = {
          root_dir = function()
            return nil
          end,
        },
      },
    },
  },
}

