return {
  {
    "Pocco81/auto-save.nvim",
    config = function()
      require("auto-save").setup({
        trigger_event = { "InsertLeave", "TextChanged" },
        debounce_delay = 1500,
      })
    end,
  },
}
