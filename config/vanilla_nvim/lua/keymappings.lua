vim.cmd("noremap <Leader>p :lua vim.lsp.buf.format()<CR>")
vim.cmd("noremap :Doff :lua vim.diagnostic.disable()<CR>")
vim.cmd("noremap :Don :lua vim.diagnostic.enable()<CR>")
