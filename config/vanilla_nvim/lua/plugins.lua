require("lazy").setup({
  "folke/which-key.nvim",
  { "folke/tokyonight.nvim", lazy = true, opts = { style = "moon" } },
  { "jose-elias-alvarez/null-ls.nvim", dependencies = { "nvim-lua/plenary.nvim" } },
  { "nvim-lualine/lualine.nvim", dependencies = { "nvim-tree/nvim-web-devicons" } },
  { "neovim/nvim-lspconfig" },
  { "williamboman/mason.nvim" },
  { "echasnovski/mini.nvim" },
})

require("tokyonight").load()

-- null-ls
require("null-ls")
local null_ls = require("null-ls")
null_ls.setup({
  sources = {
    null_ls.builtins.formatting.stylua,
    null_ls.builtins.diagnostics.eslint,
    null_ls.builtins.completion.spell,
  },
})

require("lualine").setup() -- lualine
require("config.lsp") -- lsp-config
require("mason").setup() -- Mason

require("mini.pairs").setup()
require("mini.surround").setup()
require("mini.comment").setup()
require("mini.indentscope").setup()
require("mini.completion").setup()
