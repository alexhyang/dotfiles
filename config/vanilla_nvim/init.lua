local opt = vim.opt
local cmd = vim.cmd
local keymap = vim.keymap

-- =====================================
--          Editor Interface
-- =====================================
opt.number = true
opt.relativenumber = true
opt.termguicolors = true
opt.guicursor = ""
opt.signcolumn = "yes"


-- =====================================
--          Editing
-- =====================================
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

opt.tabstop = 2
opt.expandtab = true
opt.shiftwidth = 2
opt.autoindent = true
opt.wrap = false
-- opt.backspace = indent,eol,start
opt.spell = true
opt.spelllang = "en_us"
opt.colorcolumn = "80"
opt.mouse:append("a")
-- opt.cursorline = true


-- =====================================
--          Search and Replace
-- =====================================
opt.ignorecase = true
opt.smartcase = true
opt.incsearch = true
opt.hlsearch = true


-- =====================================
--          Key map
-- =====================================
keymap.set("", "<F3>", ":noh<CR>")
keymap.set("", "<F9>", ":tabedit $HOME/.config/nvim/init.lua<CR>")
keymap.set("", "<F6>", ":so $HOME/.config/nvim/init.lua<CR>")
keymap.set("i", "jk", "<Esc>")
keymap.set("i", "kj", "<Esc>")
keymap.set("n", "<C-n>", ":tabnew<CR>")
keymap.set("n", "Q", "<Nop>")


-- =====================================
--          Plugin Manager
-- =====================================
-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- lazy.nvim
require("lazy").setup({
  spec = {
    -- Interface and Integration
    { "catppuccin/nvim",
      name = "catppuccin",
      priority = 1000,
      opts = function()
        cmd("colorscheme catppuccin-macchiato")
      end
    },
    {
      "nvim-lualine/lualine.nvim",
      dependencies = { "nvim-tree/nvim-web-devicons" }
    },
    {
      "akinsho/bufferline.nvim",
      version = "*",
      dependencies = "nvim-tree/nvim-web-devicons",
      opts = {},
    },
    {
      "nvim-tree/nvim-tree.lua",
      version = "*",
      lazy = false,
      dependencies = { "nvim-tree/nvim-web-devicons" },
      opts = {},
    },
    { "lewis6991/gitsigns.nvim",
      opts = {},
    },
    -- Editing, Highlighting
    { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
    {
      "numToStr/Comment.nvim",
      opts = {},
    },
    {
      "windwp/nvim-autopairs",
      event = "InsertEnter",
      opts = {}
    },
    -- File Finder
    {
      "nvim-telescope/telescope.nvim", tag = "0.1.8",
      dependencies = { "nvim-lua/plenary.nvim" }
    },
    -- LSP, auto-completion
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/nvim-cmp",
    "L3MON4D3/LuaSnip",
    "saadparwaiz1/cmp_luasnip",
    "rafamadriz/friendly-snippets",
    -- Others
    "wakatime/vim-wakatime",
    {
      "m4xshen/hardtime.nvim",
      dependencies = { "MunifTanjim/nui.nvim" },
      opts = {},
    },
  },
  install = { colorscheme = { "habamax" } },
  checker = { enabled = true },
})


-- =====================================
--          Plugin Settings
-- =====================================
-- lualine
require("lualine").setup({
  options = {
    icons_enabled = true,
    theme = "auto",
    component_separators = { left = "", right = ""},
    section_separators = { left = "", right = ""},
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    always_show_tabline = true,
    globalstatus = false,
    refresh = {
      statusline = 100,
      tabline = 100,
      winbar = 100,
    }
  },
  sections = {
    lualine_a = {"mode"},
    lualine_b = {"branch", "diff", "diagnostics"},
    lualine_c = {"filename"},
    lualine_x = {"encoding", "fileformat", "filetype"},
    lualine_y = {"progress"},
    lualine_z = {"location"}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {"filename"},
    lualine_x = {"location"},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  winbar = {},
  inactive_winbar = {},
  extensions = {}
})

-- nvim-tree
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
keymap.set("n", "<Leader>e", ":NvimTreeToggle<CR>")

-- nvim-treesitter
require("nvim-treesitter.configs").setup({
  ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "markdown", "markdown_inline" },
  sync_install = false,
  auto_install = true,
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
})

-- telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<C-p>', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })

-- mason
require("mason").setup({
  ui = {
    icons = {
      package_installed = "✓",
      package_pending = "➜",
      package_uninstalled = "✗"
    }
  }
})
require("mason-lspconfig").setup({
  ensure_installed = {
    "lua_ls",
  },
})

local capabilities = require("cmp_nvim_lsp").default_capabilities()
require("lspconfig").lua_ls.setup({
  capabilities = capabilities,
})

-- cmp
local cmp = require("cmp")
cmp.setup({
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
      -- vim.snippet.expand(args.body) -- For native neovim snippets (Neovim v0.10+)
    end,
  },
  window = {
    -- completion = cmp.config.window.bordered(),
    -- documentation = cmp.config.window.bordered(),
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'luasnip' }, -- For luasnip users.
    { name = 'path' },
  }, {
    { name = 'buffer' },
  })
})

