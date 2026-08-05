return {
  "wakatime/vim-wakatime", -- coding time tracker
  -- TODO: finish configuration for following plugins
  { "phaazon/hop.nvim", lazy = true },
  {
    "m4xshen/hardtime.nvim", -- help with good vim habit
    opts = {},
  },
  "antonk52/bad-practices.nvim", -- help give up bad vim habits
  {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
      {
        "windwp/nvim-ts-autotag", -- tag completion for web development
        opts = {},
      },
    },
  },
  "folke/zen-mode.nvim", -- distraction free mode
  "gpanders/editorconfig.nvim", -- editorconfig for nvim
  {
    "MunifTanjim/prettier.nvim",
    dependencies = {
      "neovim/nvim-lspconfig",
      "jose-elias-alvarez/null-ls.nvim",
    },
  },
}
