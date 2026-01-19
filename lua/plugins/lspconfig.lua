return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      basedpyright = {
        settings = {
          basedpyright = {
            analysis = {
              typeCheckingMode = "standard",
            },
          },
        },
      },
    },
  },
  config = function()
    -- Limit LSP log size by setting log level to WARN
    vim.lsp.set_log_level("WARN")
  end,
}
