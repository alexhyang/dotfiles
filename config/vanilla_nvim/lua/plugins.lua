require("lazy").setup({
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
    end,
    opts = {},
  },
  { "folke/tokyonight.nvim", lazy = true, opts = { style = "moon" } },
  { "jose-elias-alvarez/null-ls.nvim", dependencies = { "nvim-lua/plenary.nvim" } },
  { "nvim-lualine/lualine.nvim", dependencies = { "nvim-tree/nvim-web-devicons" } },
  { "neovim/nvim-lspconfig" },
  { "williamboman/mason.nvim" },
  { "echasnovski/mini.nvim" },
})

require("tokyonight").load()

require("config.null_ls") -- null-ls
require("lualine").setup() -- lualine
require("config.lsp") -- lsp
require("mason").setup() -- Mason

require("mini.pairs").setup()
require("mini.surround").setup()
require("mini.comment").setup()
require("mini.indentscope").setup()
require("mini.completion").setup()
