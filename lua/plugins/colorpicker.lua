-- #fff
return {
  { "nvzone/volt", lazy = true },
  {
    "nvzone/minty",
    cmd = { "Shades", "Huefy" },
    keys = {
      { "<leader>Cs", "<cmd>lua require('minty.shades').open({border=false}) <cr>", desc = "Color picker Shades" },
      { "<leader>Ch", "<cmd>Huefy<cr>", desc = "Color picker Huefy" },
    },
  },
}
