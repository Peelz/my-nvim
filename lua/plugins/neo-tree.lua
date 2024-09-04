local function open_all_subnodes(state)
  local node = state.tree:get_node()
  local filesystem_commands = require("neo-tree.sources.filesystem.commands")
  filesystem_commands.expand_all_nodes(state, node)
end

return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = {
    window = {
      mappings = {
        ["L"] = open_all_subnodes,
      },
    },
  },
}
