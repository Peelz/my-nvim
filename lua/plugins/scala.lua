local map = vim.keymap.set

return {
  -- add treesitter support for scala
  -- {
  --   "nvim-treesitter/nvim-treesitter",
  --   opts = {
  --     ensure_installed = { "scala" },
  --   },
  -- },
  -- {
  --   keys = {
  --     { "<leader>cW", function () require('metals').hover_worksheet() end, desc = "Metals Worksheet" },
  --     { "<leader>cM", function () require('telescope').extensions.metals.commands() end, desc = "Telescope Metals Commands" },
  --   },
  --   "mfussenegger/nvim-dap",
  --   optional = true,
  --   opts = function()
  --     -- Debug settings
  --     local dap = require("dap")
  --     dap.configurations.scala = {
  --       {
  --         type = "scala",
  --         request = "launch",
  --         name = "RunOrTest",
  --         metals = {
  --           runType = "runOrTestFile",
  --           --args = { "firstArg", "secondArg", "thirdArg" }, -- here just as an example
  --         },
  --       },
  --       {
  --         type = "scala",
  --         request = "launch",
  --         name = "Test Target",
  --         metals = {
  --           runType = "testTarget",
  --         },
  --       },
  --     }
  --   end,
  -- },
  {
    "scalameta/nvim-metals",
    dependencies = {
      "nvim-lua/plenary.nvim",
      {
        "j-hui/fidget.nvim",
        opts = {},
      },
      {
        "mfussenegger/nvim-dap",
        config = function(self, opts)
          -- Debug settings if you're using nvim-dap
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
    },
    keys = {
      -- {
      --   "<leader>cW",
      --   function()
      --     require("metals").hover_worksheet()
      --   end,
      --   desc = "Metals Worksheet",
      -- },
      {
        "<leader>cM",
        function()
          require("telescope").extensions.metals.commands()
        end,
        desc = "Metals Commands",
      },
    },
    ft = { "scala", "sbt", "java" },
    opts = function()
      local metals_config = require("metals").bare_config()
      metals_config.settings = {
        showImplicitArguments = true,
        excludedPackages = { "akka.actor.typed.javadsl", "pekko.actor.typed.javadsl" },
      }
      metals_config.init_options.statusBarProvider = "on"
      metals_config.capabilities = require("cmp_nvim_lsp").default_capabilities()

      metals_config.on_attach = function(client, bufnr)
        -- LSP mappings
        map("n", "gD", vim.lsp.buf.definition)
        map("n", "K", vim.lsp.buf.hover)
        map("n", "gi", vim.lsp.buf.implementation)
        map("n", "gr", vim.lsp.buf.references)
        map("n", "gds", vim.lsp.buf.document_symbol)
        map("n", "gws", vim.lsp.buf.workspace_symbol)
        map("n", "<leader>cl", vim.lsp.codelens.run)
        map("n", "<leader>sh", vim.lsp.buf.signature_help)
        map("n", "<leader>rn", vim.lsp.buf.rename)
        map("n", "<leader>f", vim.lsp.buf.format)
        map("n", "<leader>ca", vim.lsp.buf.code_action)

        -- Example mappings for usage with nvim-dap. If you don't use that, you can
        -- skip these
        map("n", "<leader>dc", function()
          require("dap").continue()
        end)

        map("n", "<leader>dr", function()
          require("dap").repl.toggle()
        end)

        map("n", "<leader>dK", function()
          require("dap.ui.widgets").hover()
        end)

        map("n", "<leader>dt", function()
          require("dap").toggle_breakpoint()
        end)

        map("n", "<leader>dso", function()
          require("dap").step_over()
        end)

        map("n", "<leader>dsi", function()
          require("dap").step_into()
        end)

        map("n", "<leader>dl", function()
          require("dap").run_last()
        end)
      end

      return metals_config
    end,
    config = function(self, metals_config)
      local nvim_metals_group = vim.api.nvim_create_augroup("nvim-metals", { clear = true })
      vim.api.nvim_create_autocmd("FileType", {
        pattern = self.ft,
        callback = function()
          require("metals").initialize_or_attach(metals_config)
        end,
        group = nvim_metals_group,
      })
    end,
  },
}
