return {
  -- add treesitter support for scala
  -- {
  --   "nvim-treesitter/nvim-treesitter",
  --   opts = {
  --     ensure_installed = { "scala" },
  --   },
  -- },
  {
    "mfussenegger/nvim-dap",
    optional = true,
    opts = function()
      -- Debug settings
      local dap = require("dap")
      dap.configurations.scala = {
        {
          type = "scala",
          request = "launch",
          name = "RunOrTest",
          metals = {
            runType = "runOrTestFile",
            --args = { "firstArg", "secondArg", "thirdArg" }, -- here just as an example
          },
        },
        {
          type = "scala",
          request = "launch",
          name = "Test Target",
          metals = {
            runType = "testTarget",
          },
        },
      }
    end,
  },
  -- {
  --   "j-hui/fidget.nvim",
  --   tag = "legacy",
  --   config = true,
  -- },
  -- {
  --   "scalameta/nvim-metals",
  --   ft = { "scala", "sbt" },
  --   dependencies = {
  --     "nvim-lua/plenary.nvim",
  --     "mfussenegger/nvim-dap",
  --   },
  --   -- stylua: ignore
  --   keys = {
  --     { "<leader>cW", function () require('metals').hover_worksheet() end, desc = "Metals Worksheet" },
  --     { "<leader>cM", function () require('telescope').extensions.metals.commands() end, desc = "Telescope Metals Commands" },
  --   },
  --   opts = function()
  --     local metals_config = require("metals").bare_config()
  --     metals_config.on_attach = function(client, bufnr)
  --       -- your on_attach function
  --     end
  --
  --     return metals_config
  --   end,
  --   config = function()
  --     local metals_config = require("metals").bare_config()
  --     metals_config.settings = {
  --       showInferredType = true,
  --       excludedPackages = {
  --         "akka.actor.typed.javadsl",
  --         "com.github.swagger.akka.javadsl",
  --       },
  --     }
  --     require("metals").initialize_or_attach(metals_config)
  --   end,
  -- },
  --
  -- Correctly setup lspconfig for Scala 🚀
  -- {
  --   "neovim/nvim-lspconfig",
  --   dependencies = {
  --     "scalameta/nvim-metals",
  --   },
  --   opts = {
  --     setup = {
  --       metals = {},
  --     },
  --   },
  -- },
}
