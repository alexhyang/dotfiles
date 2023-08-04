-- default: https://github.com/LazyVim/LazyVim/tree/main/lua/lazyvim/plugins
-- starter: https://github.com/LazyVim/starter/tree/main/lua
return {
  -- ============= plugins/coding.lua =============
  -- { "L3MON4D3/LuaSnip", enabled = false }, -- snippets
  -- { "hrsh7th/nvim-cmp", enabled = false }, -- auto completion
  -- cmp-buffer: nvim-cmp
  -- cmp-nvim-lsp
  -- cmp-path
  -- cmp-luasnip
  -- { "echasnovski/mini.pairs", enabled = false }, -- auto pairs
  -- { "echasnovski/mini.surround", enabled = false }, -- fast and feature-rich surround actions
  -- { "JoosepAlviste/nvim-ts-context-commentstring", enabled = false }, -- comments
  -- { "echasnovski/mini.comment", enabled = false }, -- comments
  -- { "echasnovski/mini.ai", enabled = false }, -- better text-objects
  -- ============= plugins/colorscheme.lua =============
  -- { "folke/tokyonight.nvim", enabled = false },
  -- { "catppuccin/nvim", enabled = false },
  -- ============= plugins/core.lua =============
  -- { "folke/lazy.nvim", enabled = false },
  -- { "LazyVim/LazyVim", enabled = false },
  -- ============= plugins/editor.lua =============
  -- { "nvim-neo-tree/neo-tree.nvim", enabled = false }, -- file explorer
  -- { "nvim-pack/nvim-spectre", enabled = false }, -- search/replace in multiple files
  -- { "nvim-telescope/telescope.nvim", enabled = false }, -- fuzzy finder
  -- { "folke/flash.nvim", enabled = false }, -- enhances the built-in search functionality
  -- { "nvim-telescope/telescope.nvim", enabled = false }, -- Flash Telescope confi},
  -- { "ggandor/leap.nvim", enabled = false }, -- disable old installations of leap and flit.
  -- { "folke/which-key.nvim", enabled = false }, -- helps you remember key bindings by showing a popup
  -- { "lewis6991/gitsigns.nvim", enabled = false }, -- git highlights in editor
  -- { "RRethy/vim-illuminate", enabled = false }, -- word highlighter
  -- { "echasnovski/mini.bufremove", enabled = false }, -- buffer remove
  -- { "folke/trouble.nvim", enabled = false }, -- better diagnostics list and others
  -- { "folke/todo-comments.nvim", enabled = false }, -- TODO comments
  -- ============= plugins/treesitter.lua =============
  -- { "nvim-treesitter/nvim-treesitter", enabled = false }, -- Treesitter syntax highlighting.
  -- ============= plugins/ui.lua =============
  { "rcarriga/nvim-notify", enabled = false }, -- Better `vim.notify()`
  -- { "stevearc/dressing.nvim", enabled = false }, -- better vim.ui
  { "akinsho/bufferline.nvim", enabled = false }, -- fancy-looking tabs
  -- { "nvim-lualine/lualine.nvim", enabled = false }, -- statusline
  -- { "lukas-reineke/indent-blankline.nvim", enabled = false }, -- indent guides for Neovim
  -- { "echasnovski/mini.indentscope", enabled = false }, -- Active indent guide and indent text objects.
  -- { "folke/which-key.nvim", enabled = false }, -- noicer ui
  -- { "folke/noice.nvim", enabled = false }, -- noicer ui
  { "goolord/alpha-nvim", enabled = false }, -- nvim start dashboard
  -- { "SmiteshP/nvim-navic", enabled = false }, -- lsp symbol navigation for lualine
  -- { "nvim-tree/nvim-web-devicons", lazy = true, enabled = false }, -- icons
  -- { "MunifTanjim/nui.nvim", lazy = true, enabled = false }, -- ui components
  -- ============= plugins/util.lua =============
  { "dstein64/vim-startuptime", enabled = false }, -- measure startuptime
  { "folke/persistence.nvim", enabled = false }, -- Session management
  -- { "nvim-lua/plenary.nvim", lazy = true, enabled = false }, -- library used by other plugins
  -- ============= plugins/extras =============
  -- extra plugins are enabled in config/lazy.lua
  -- ============= plugins/lsp/init.lua =============
  -- { "neovim/nvim-lspconfig", enabled = false }, -- lspconfig
  -- { "jose-elias-alvarez/null-ls.nvim" }, -- formmaters
  -- { "williamboman/mason.nvim" }, -- cmd line tools and package manager
  -- SchemaStore.nvim: nvim-lspconfig
  -- mason-lspconfig.nvim: nvim-lspconfig dependency
  -- neoconf.nvim: nvim-lspconfig dependency
  -- ============= to find later =============
  -- venv-selector.nvim
}
