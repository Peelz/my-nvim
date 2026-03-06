# AGENTS.md

This is a LazyVim-based Neovim configuration repository. All code is written in Lua.

## Build/Lint/Test Commands

Since this is a Neovim configuration, there are no traditional build/test commands. Verification is done by:

- **Check config syntax**: Start Neovim to ensure no Lua errors
- **Format code**: `stylua .` (formats all Lua files according to stylua.toml)
- **Check specific file**: `stylua lua/config/autocmds.lua`

**Testing changes**: After editing any Lua file, restart Neovim (`nvim`) to verify changes load without errors.

## Code Style Guidelines

### Formatting
- Use **stylua** for formatting (configured in stylua.toml)
- Indentation: 2 spaces
- Line width: 120 characters
- No trailing whitespace

### File Structure
- `lua/config/`: Configuration files (autocmds, keymaps, options, lazy plugin manager)
- `lua/plugins/`: Plugin specifications returning Lua tables
- `init.lua`: Entry point that loads config/lazy.lua and config/local.lua

### Plugin Specifications (lua/plugins/*.lua)
All plugin files must return a table containing plugin specs:

```lua
return {
  {
    "author/plugin-name",
    dependencies = { "dep1", "dep2" },
    ft = { "filetype" },
    keys = {
      { "<leader>xx", "<cmd>Command<cr>", desc = "Description", mode = "n" },
    },
    opts = {
      option = value,
    },
    config = function()
      require("plugin").setup()
    end,
  },
}
```

### Configuration Files (lua/config/*.lua)
- Use `vim.api.nvim_create_autocmd()` for autocmds
- Use `vim.opt` or `vim.o` for setting options
- Use `vim.keymap.set()` for keybindings
- Use `vim.g` for global variables
- All config is loaded via VeryLazy event unless specified

### Imports and Requires
- Use `require("module.path")` for imports
- LazyVim modules: `require("lazyvim.plugins")`
- Plugin functions: `require("plugin-name").function_name()`
- Neovim API: `vim.api.nvim_*`

### Naming Conventions
- Files: lowercase with underscores (snake_case)
- Variables: lowercase with underscores
- Functions: lowercase with underscores
- Constants: UPPER_CASE or lowercase
- Plugin tables: Standard Lua table syntax

### Autocmds Pattern
```lua
vim.api.nvim_create_autocmd("Event", {
  pattern = "*",
  callback = function()
  end,
  once = false,  -- optional
})
```

### Error Handling
- Use `pcall(require, "module")` for optional dependencies
- Use `if condition then return {} end` to conditionally disable plugins
- Use `vim.defer_fn()` to avoid startup race conditions

### Comments
- Use `--` for single-line comments
- Add comments for complex logic or non-obvious configurations
- Reference LazyVim defaults where applicable

### LSP Configuration
Extend LazyVim's LSP config in `lua/plugins/lspconfig.lua` or language-specific plugin files:

```lua
return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      language_server = {
        settings = {},
      },
    },
  },
}
```

### Treesitter Configuration
```lua
return {
  "nvim-treesitter/nvim-treesitter",
  opts = function(_, opts)
    vim.list_extend(opts.ensure_installed or {}, { "language" })
  end,
}
```

### Filetype Detection
Add custom filetypes using `vim.filetype.add()` in config/options.lua or autocmds.

### Keybindings
Use `vim.keymap.set(mode, lhs, rhs, opts)` where:
- `mode`: "n" (normal), "i" (insert), "v" (visual), "x" (visual block)
- `lhs`: key mapping string
- `rhs`: command or function
- `opts`: table with `desc` for description

### Local Configuration
Local config can be added to `lua/config/local.lua` (loaded via pcall for optional).

### Performance
- Use `lazy = true` for plugins that should lazy-load
- Use `event` or `ft` for lazy-loading triggers
- Disable unused rtp plugins in lazy.lua

### Notes
- This config disables autoformat globally (`vim.g.autoformat = false`)
- Uses basedpyright for Python LSP
- LSP logs rotate at 10MB
- Autosave enabled on cursor movement with 0.3s delay
