-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "lua", "python" },
  callback = function()
    vim.b.autoformat = false
  end,
})

-- TypeSpec filetype detection
vim.filetype.add({
  extension = {
    tsp = "typespec",
  },
  filename = {
    ["tspconfig.yaml"] = "yaml",
  },
})

-- TypeSpec comment strings
vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "typespec" },
  callback = function()
    vim.bo.commentstring = "// %s"
  end,
})

-- Rotate LSP log if it exceeds 10MB (deferred to avoid TUI race)
vim.api.nvim_create_autocmd("VimEnter", {
  once = true,
  callback = function()
    vim.defer_fn(function()
      local log_path = vim.fn.stdpath("state") .. "/lsp.log"
      local stat = (vim.uv or vim.loop).fs_stat(log_path)
      if stat and stat.size > 10 * 1024 * 1024 then
        os.rename(log_path, log_path .. ".old")
      end
    end, 100)
  end,
})
