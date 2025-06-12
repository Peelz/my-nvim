local function open_all_subnodes(state)
  local node = state.tree:get_node()
  local filesystem_commands = require("neo-tree.sources.filesystem.commands")
  filesystem_commands.expand_all_nodes(state, node)
end

local function copyfullpath(state)
  -- INFO: origin config
  local node = state.tree:get_node()
  local path = node:get_id()
  vim.fn.setreg("+", path, "c")
end

local function copypath(state)
  -- NeoTree is based on [NuiTree](https://github.com/MunifTanjim/nui.nvim/tree/main/lua/nui/tree)
  -- The node is based on [NuiNode](https://github.com/MunifTanjim/nui.nvim/tree/main/lua/nui/tree#nuitreenode)
  local node = state.tree:get_node()
  local filepath = node:get_id()
  local filename = node.name
  local modify = vim.fn.fnamemodify

  local results = {
    filepath,
    modify(filepath, ":."),
    modify(filepath, ":~"),
    filename,
    modify(filename, ":r"),
    modify(filename, ":e"),
  }

  vim.ui.select({
    "1. Absolute path: " .. results[1],
    "2. Path relative to CWD: " .. results[2],
    "3. Path relative to HOME: " .. results[3],
    "4. Filename: " .. results[4],
    "5. Filename without extension: " .. results[5],
    "6. Extension of the filename: " .. results[6],
  }, { prompt = "Choose to copy to clipboard:" }, function(choice)
    local i = tonumber(choice:sub(1, 1))
    local result = results[i]
    vim.fn.setreg('"', result)
    vim.notify("Copied: " .. result)
  end)
end
return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = {
    window = {
      mappings = {
        ["L"] = {
          open_all_subnodes,
          desc = "Open nodes",
        },
      },
    },
  },
}
