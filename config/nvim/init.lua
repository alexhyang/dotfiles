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
opt.wrap = true
opt.linebreak = true
-- opt.backspace = indent,eol,start
opt.spell = true
opt.spelllang = "en_us"
-- opt.colorcolumn = "80"
cmd("set cc=78,80,120")
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
--         Macros
-- =====================================
-- Markdown formatting
cmd("let @t = \"Bi`\\<Esc>Ea`\\<Esc>\"")
cmd("let @b = \"Bi**\\<Esc>Ea**\\<Esc>\"")
cmd("let @i = \"Bi*\\<Esc>Ea*\\<Esc>\"")
cmd("let @l = \"Bi$\\<Esc>Ea$\\<Esc>\"")
cmd("let @u = \"o*\\<Space>\\<Space>\\<Space>\"")
cmd("let @o = \"o1.\\<Space>\\<Space>\"")
cmd("let @c = \"o```\\<CR>```\\<Esc>kA\"")
cmd("let @d = \"o*\\<Space>\\<Space>\\<Space>[\\<Space>]\\<Space>\"")
cmd("let @m = \"F[lrx\"")


-- =====================================
--          More options
-- =====================================

opt.autowrite = true                      -- Enable auto write
opt.clipboard = "unnamedplus"             -- Sync with system clipboard
opt.completeopt = "menu,menuone,noselect" -- List of options for Insert mode completion
opt.conceallevel = 3                      -- Hide * markup for bold and italic
-- opt.confirm = true -- Confirm to save changes before exiting modified buffer
opt.confirm = false
opt.cursorline = true          -- Enable highlighting of the current line
opt.expandtab = true           -- Use spaces instead of tabs
opt.formatoptions = "jcroqlnt" -- tcqj
opt.grepformat = "%f:%l:%c:%m"
opt.grepprg = "rg --vimgrep"
opt.ignorecase = true                                  -- Ignore case
opt.inccommand = "nosplit"                             -- preview incremental substitute
opt.laststatus = 0
opt.list = true                                        -- Show some invisible characters (tabs...
opt.mouse = "a"                                        -- Enable mouse mode
opt.number = true                                      -- Print line number
opt.pumblend = 10                                      -- Popup blend
opt.pumheight = 10                                     -- Maximum number of entries in a popup
opt.relativenumber = true                              -- Relative line numbers
opt.scrolloff = 4                                      -- Lines of context
opt.sessionoptions = { "buffers", "curdir", "tabpages", "winsize" }
opt.shiftround = true                                  -- Round indent to multiples of shiftwidth
opt.shiftwidth = 2                                     -- Size of an indent
opt.shortmess:append({ W = true, I = true, c = true }) -- Short file messages
-- opt.showmode = false -- Dont show mode since we have a statusline
opt.showmode = true                                    -- Dont show mode since we have a statusline
opt.sidescrolloff = 8                                  -- Columns of context
opt.signcolumn =
"yes"                                                  -- Always show the signcolumn, otherwise it would shift the text each time
opt.smartcase = true                                   -- Don't ignore case with capitals
opt.smartindent = true                                 -- Insert indents automatically
opt.spelllang = { "en" }
opt.splitbelow = true                                  -- Put new windows below current
opt.splitright = true                                  -- Put new windows right of current
opt.tabstop = 2                                        -- Number of spaces tabs count for
opt.termguicolors = true                               -- True color support
opt.timeoutlen = 300
opt.undofile = true                                    -- Save undo history to undo file
opt.undolevels = 10000
opt.updatetime = 200                                   -- Save swap file and trigger CursorHold
opt.wildmode = "longest:full,full"                     -- Command-line completion mode
opt.winminwidth = 5                                    -- Minimum window width
-- opt.wrap = false                                       -- Disable line wrap

-- Fix markdown indentation settings
opt.conceallevel = 0
vim.g.markdown_recommended_style = 0
vim.g.markdown_syntax_conceal = 0


-- =====================================
--          Key map
-- =====================================
keymap.set("", "<F3>", ":noh<CR>")
-- keymap.set("n", "<F8>", ":TagbarToggle<CR>")
keymap.set("", "<F9>", ":tabedit $HOME/.config/nvim/init.lua<CR>")
keymap.set("i", "jk", "<Esc>")
keymap.set("n", "<C-n>", ":tabnew<CR>")
keymap.set("n", "<leader>bd", ":bd<CR>")
keymap.set("n", "Q", "<Nop>")
-- cmd("noremap <Leader>p :lua vim.lsp.buf.format()<CR>")
cmd("noremap :Dof :lua vim.diagnostic.disable()<CR>")
cmd("noremap :Don :lua vim.diagnostic.enable()<CR>")
cmd("noremap :cat :lua vim.api.nvim_command('echo \"dark->bright: mocha, macchiato, frappe, latte \"')<CR>")


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
      { out,                            "WarningMsg" },
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
    {
      "catppuccin/nvim",
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
    {
      "lewis6991/gitsigns.nvim",
      opts = {},
    },
    -- {
    --   "preservim/tagbar",
    --   opts = {}
    -- },
    {
      "OXY2DEV/markview.nvim",
      lazy = false,  -- Recommended
      priority = 49, -- 50 is lazy's default priority
      opts = {
        preview = { enable = false },
        markdown = {
          list_items = { enable = false },
          headings = {
            enable = true,
            heading_1 = { style = "simple" },
            heading_2 = { style = "simple" },
            heading_3 = { style = "simple" },
            heading_4 = { style = "simple" },
          },
        },
        code_blocks = {
          enable = true,
          style = "simple",
          min_width = 40,
          border_hl = "MarkviewCode",
        }
      },
      dependencies = {
        "nvim-treesitter/nvim-treesitter",
        "nvim-tree/nvim-web-devicons"
      },
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
    {
      "phaazon/hop.nvim",
      branch = "v2",
      opts = {},
    },
    -- File Finder
    {
      "nvim-telescope/telescope.nvim",
      tag = "0.1.8",
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
    {
      "folke/todo-comments.nvim",
      dependencies = { "nvim-lua/plenary.nvim" },
      opts = {},
    },
    {
      "folke/trouble.nvim",
      opts = {}, -- for default options, refer to the configuration section for custom setup.
      cmd = "Trouble",
      keys = {
        {
          "<leader>xx",
          "<cmd>Trouble diagnostics toggle<cr>",
          desc = "Diagnostics (Trouble)",
        },
        {
          "<leader>xX",
          "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
          desc = "Buffer Diagnostics (Trouble)",
        },
        {
          "<leader>cs",
          "<cmd>Trouble symbols toggle focus=false<cr>",
          desc = "Symbols (Trouble)",
        },
        {
          "<leader>cl",
          "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
          desc = "LSP Definitions / references / ... (Trouble)",
        },
        {
          "<leader>xL",
          "<cmd>Trouble loclist toggle<cr>",
          desc = "Location List (Trouble)",
        },
        {
          "<leader>xQ",
          "<cmd>Trouble qflist toggle<cr>",
          desc = "Quickfix List (Trouble)",
        },
      },
    },
    {
      "folke/which-key.nvim",
      event = "VeryLazy",
      opts = {},
      keys = {
        {
          "<leader>?",
          function()
            require("which-key").show({ global = false })
          end,
          desc = "Buffer Local Keymaps (which-key)",
        },
      },
    },
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
-- key maps
-- keymap.set("n", "<leader>m", ":Markview<CR>",
--   { desc = "Toggle Markview gloablly" })
-- keymap.set("n", "<leader>s", ":Markview splitToggle<CR>",
--   { desc = "Toggle 'splitview' for curent buffer" })


-- lualine
require("lualine").setup({
  options = {
    icons_enabled = true,
    theme = "auto",
    component_separators = { left = "", right = "" },
    section_separators = { left = "", right = "" },
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
    lualine_a = { "mode" },
    lualine_b = { "branch", "diff", "diagnostics" },
    lualine_c = { "filename" },
    lualine_x = { "encoding", "fileformat", "filetype" },
    lualine_y = { "progress" },
    lualine_z = { "location" }
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = { "filename" },
    lualine_x = { "location" },
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  winbar = {},
  inactive_winbar = {},
  extensions = {}
})

-- bufferline
local bufferline = require("bufferline")
bufferline.setup({
  options = {
    mode = "buffers",
    style_preset = bufferline.style_preset.minimal,
    numbers = "none",
    indicator = {
      style = "underline"
    },
    tab_size = 12,
    diagnostics = "nvim_lsp",
    offsets = {
      {
        filetype = "NvimTree",
        textAlign = "left",
        separator = false
      }
    },
    show_buffer_icons = false,
    show_buffer_close_icons = false,
    separator_style = "thin",
  }
})

-- nvim-tree
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.keymap.set("n", "<F7>", ":NvimTreeToggle<CR>")

-- nvim-treesitter
require("nvim-treesitter.configs").setup({
  ensure_installed = {
    "lua",
    "vim",
    "vimdoc",
    "query",
    "markdown",
    "markdown_inline",
    -- "c",
    -- "cpp",
    "typescript",
    -- "latex"
  },
  sync_install = false,
  auto_install = true,
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
})

-- hop
local hop = require('hop')
local directions = require('hop.hint').HintDirection
vim.keymap.set('', 'f', function()
  hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true })
end, { remap = true })
vim.keymap.set('', 'F', function()
  hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true })
end, { remap = true })
vim.keymap.set('', 't', function()
  hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true, hint_offset = -1 })
end, { remap = true })
vim.keymap.set('', 'T', function()
  hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true, hint_offset = 1 })
end, { remap = true })
vim.keymap.set('', '<leader><leader>f', ':HopWord<CR>');

-- telescope
local builtin = require('telescope.builtin')
require("telescope").setup({
  defaults = {
    file_ignore_patterns = { "node_modules", ".git" }
  }
})

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

-- Setup language servers.
local capabilities = require("cmp_nvim_lsp").default_capabilities()
vim.lsp.config['lua_ls'] = {
  capabilities = capabilities,
}

vim.lsp.config['ts_ls'] = {
  capabilities = capabilities,
}

vim.lsp.config['pylsp'] = {
  capabilities = capabilities,
}

vim.lsp.config['clangd'] = {}
vim.lsp.config['rust_analyzer'] = {
  -- Server-specific settings. See `:help lspconfig-setup`
  settings = {
    ["rust-analyzer"] = {},
  }
}
vim.lsp.enable('lua_ls')
vim.lsp.enable('ts_ls')
vim.lsp.enable('pylsp')

-- Global mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "open diagnostic float" })
keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "prev diagnostic" })
keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "next diagnostic" })
keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "diagnostic setloclist" })

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("UserLspConfig", {}),
  callback = function(ev)
    -- Enable completion triggered by <c-x><c-o>
    vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

    -- Buffer local mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    -- local opts = { buffer = ev.buf, desc = "lsp.buf" }
    local function make_opt(desc)
      return { buffer = ev.buf, desc = desc }
    end
    keymap.set("n", "gD", vim.lsp.buf.declaration, make_opt("Jump to declaration"))
    keymap.set("n", "<space>D", vim.lsp.buf.type_definition, make_opt("Jump to type definition"))
    keymap.set("n", "gd", vim.lsp.buf.definition, make_opt("Jump to definition"))
    keymap.set("n", "gi", vim.lsp.buf.implementation, make_opt("List all implementations"))
    keymap.set("n", "gr", vim.lsp.buf.references, make_opt("List all references"))
    keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, make_opt("Show signature help"))
    keymap.set("n", "K", vim.lsp.buf.hover, opts)
    keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, make_opt("Add workspace folder"))
    keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, make_opt("Remove workspace folder"))
    keymap.set("n", "<space>wl", function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, make_opt("List workspace folder"))
    keymap.set({ "n", "v" }, "<space>ca", vim.lsp.buf.code_action, make_opt("Select code action"))
    keymap.set("n", "<leader>p", function()
      vim.lsp.buf.format({ async = true })
    end, make_opt("Format file"))
  end,
})

-- cmp
local cmp = require("cmp")
local luasnip = require("luasnip")
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
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expandable() then
        luasnip.expand()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end, { "i", "s", }),
    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { "i", "s", }),
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'luasnip' }, -- For luasnip users.
    { name = 'path' },
  }, {
    { name = 'buffer' },
  })
})

-- todo comments
vim.keymap.set("n", "]t", function()
  require("todo-comments").jump_next()
end, { desc = "Next todo comment" })

vim.keymap.set("n", "[t", function()
  require("todo-comments").jump_prev()
end, { desc = "Previous todo comment" })

-- =====================================
--          Autocmds
-- =====================================
-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set:
-- https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua

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

-- vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
--   title = "hover",
-- })


-- =====================================
--      Using Nvim on Windows
-- =====================================
-- USE "\" instead of "/" as delimiting characters in Windows
-- (UNCOMMENT the following key mappings if using Windows)
-- keymap.set("", "<F9>", ":tabedit $HOME\\.dotfiles\\nvim\\init.lua<CR>")

-- gitsigns complete setup will cause neovim on Windows to freeze when quitting
-- (COMMENT OUT the following gitsigns setup if using Windows)
require('gitsigns').setup({
  on_attach = function(bufnr)
    local gitsigns = require('gitsigns')

    local function map(mode, l, r, opts)
      opts = opts or {}
      opts.buffer = bufnr
      vim.keymap.set(mode, l, r, opts)
    end

    -- Navigation
    map('n', ']c', function()
        if vim.wo.diff then
          vim.cmd.normal({ ']c', bang = true })
        else
          gitsigns.nav_hunk('next')
        end
      end,
      {
        desc = "next hunk"
      })

    map('n', '[c', function()
        if vim.wo.diff then
          vim.cmd.normal({ '[c', bang = true })
        else
          gitsigns.nav_hunk('prev')
        end
      end,
      {
        desc = "prev hunk"
      })

    -- Actions
    map('n', '<leader>hs', gitsigns.stage_hunk, { desc = "stage hunk" })
    map('n', '<leader>hr', gitsigns.reset_hunk, { desc = "reset hunk" })
    map('v', '<leader>hs', function() gitsigns.stage_hunk { vim.fn.line('.'), vim.fn.line('v') } end,
      { desc = "stage hunk" })
    map('v', '<leader>hr', function() gitsigns.reset_hunk { vim.fn.line('.'), vim.fn.line('v') } end,
      { desc = "reset hunk" })
    map('n', '<leader>hS', gitsigns.stage_buffer, { desc = "stage buffer" })
    map('n', '<leader>hu', gitsigns.undo_stage_hunk, { desc = "undo stage hunk" })
    map('n', '<leader>hR', gitsigns.reset_buffer, { desc = "reset buffer" })
    map('n', '<leader>hp', gitsigns.preview_hunk, { desc = "preview hunk" })
    map('n', '<leader>hi', gitsigns.preview_hunk_inline, { desc = "preview hunk inline" })
    map('n', '<leader>hb', function() gitsigns.blame_line { full = true } end, { desc = "blame line" })
    map('n', '<leader>hd', gitsigns.diffthis, { desc = "diff this (against index)" })
    map('n', '<leader>hD', function() gitsigns.diffthis('~') end, { desc = "diff this (against HEAD)" })
    map('n', '<leader>hq', gitsigns.setqflist, { desc = "list hunks in quickfix" })
    map('n', '<leader>hQ', function() gitsigns.setqflist('all') end, { desc = "list all hunks in quickfix" })

    -- Toggles
    map('n', '<leader>tb', gitsigns.toggle_current_line_blame, { desc = "toggle curr line blame" })
    map('n', '<leader>td', gitsigns.toggle_deleted, { desc = "toggle deleted" })
    map('n', '<leader>tw', gitsigns.toggle_word_diff, { desc = "toggle word diff" })

    -- Text object
    map({ 'o', 'x' }, 'ih', ':<C-U>Gitsigns select_hunk<CR>')
  end
})

-- require('tagbar').setup({})
