return {
  "stevearc/conform.nvim",
  opts = {
    formatters_by_ft = {
      sql = { "sqruff" },
      pgsql = { "sqruff" },
    },
    -- formatters = {
    --   sqlfluff = {
    --     command = "sqlruff",
    --     args = { "format", "--dialect=postgres", "-" },
    --     stdin = true,
    --     cwd = function()
    --       return vim.fn.getcwd()
    --     end,
    --   },
    -- },
  },
}
