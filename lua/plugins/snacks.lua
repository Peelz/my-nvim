return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  opts = {
    picker = {
      sources = {
        explorer = {
          actions = {
            recursive_toggle = function(picker, item)
              local Actions = require("snacks.explorer.actions")

              local function open_recursively(node)
                if node.type == "directory" and node.children and #node.children == 1 then
                  Actions.toggle(picker, node)
                  open_recursively(node.children[1])
                end
              end

              open_recursively(item)
              Actions.update(picker, { refresh = true })
            end,
          },
          win = {
            list = {
              keys = {
                ["L"] = "recursive_toggle", -- Map Shift-L to recursive toggle in explorer
              },
            },
          },
        },
      },
    },
  },
}
