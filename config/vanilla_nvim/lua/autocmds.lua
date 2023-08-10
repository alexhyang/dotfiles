-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-- Disable autoformat for shell & markdown files
vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "markdown", "shell" },
  callback = function()
    vim.b.autoformat = false
  end,
})

-- Disable inline LSP diagnostics
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
  virtual_text = false,
})
