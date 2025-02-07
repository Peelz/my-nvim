-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.opt.nu = true
vim.opt.relativenumber = true
-- vim.o.statuscolumn = "%s %l %r "-- LSP Server to use for Python.

-- Set to "basedpyright" to use basedpyright instead of pyright.
vim.g.lazyvim_python_lsp = "basedpyright"
-- vim.g.lazyvim_python_lsp = "pyright"
-- Set to "ruff_lsp" to use the old LSP implementation version.
vim.g.lazyvim_python_ruff = "ruff"
vim.o.termguicolors = true

vim.filetype.add {
  extension = {
    jinja = 'jinja',
    jinja2 = 'jinja',
    j2 = 'jinja',
  },
}
vim.g.autoformat = false
