---@diagnostic disable: undefined-global, redundant-parameter
-- ANGEL CAMPBELL'S WONDERFUL HORRIBLE VIM CONFIG
-- note: this is not a good endorsement
--       of me as a serious person

------------------------------------------------------------
-- > YOU ARE LOVED
-- > YOU ARE WORTHY OF THAT LOVE
-- > YOU ARE NOT IN TROUBLE
-- > DRINK WATER
------------------------------------------------------------

-- XXX SETTINGS
vim.g.qf_join_changes = true -- for editing quickfix
vim.o.hlsearch = false
vim.o.expandtab = true
vim.o.tabstop = 4
vim.o.shiftwidth = 2
vim.o.timeout = true
vim.o.timeoutlen = 300
vim.o.grepprg = "rg --vimgrep --no-heading --smart-case"
vim.o.autochdir = false
vim.o.clipboard = "unnamedplus"
vim.o.signcolumn = 'yes'
vim.o.foldmethod = "expr"
vim.o.wrap = false
vim.o.foldlevel = 99
vim.o.foldexpr = "nvim_treesitter#foldexpr()"
vim.o.ignorecase = true
vim.o.smartcase = true
vim.g.netrw_banner = 0

vim.o.background = "light"

--------------------------------------------------------------------------------

-- XXX KEYMAPPINGS
vim.g.mapleader = " "
vim.g.maplocalleader = ","

-- windows
vim.keymap.set("n", "<C-j>", "<C-W>j")
vim.keymap.set("n", "<C-k>", "<C-W>k")
vim.keymap.set("n", "<C-h>", "<C-W>h")
vim.keymap.set("n", "<C-l>", "<C-W>l")

--tabs
vim.keymap.set("n", "H", "gT")
vim.keymap.set("n", "L", "gt")

-- resize
vim.keymap.set("n", "<Left>", ":vertical res -5<CR>")
vim.keymap.set("n", "<Right>", ":vertical res +5<CR>")

vim.keymap.set("n", "<Up>", ":res +5<CR>")
vim.keymap.set("n", "<Down>", ":res -5<CR>")

-- terminal
vim.keymap.set("t", "jj", "<C-\\><C-n>")
vim.keymap.set("t", "<ESC>", "<C-\\><C-n>")
vim.keymap.set("t", "<C-h>", "<C-\\><C-n><C-w>h")
vim.keymap.set("t", "<C-j>", "<C-\\><C-n><C-w>j")
vim.keymap.set("t", "<C-k>", "<C-\\><C-n><C-w>k")
vim.keymap.set("t", "<C-l>", "<C-\\><C-n><C-w>l")

-- lsp
vim.keymap.set("n", "<localleader>f", vim.lsp.buf.format)
vim.keymap.set("n", "<localleader>r", vim.lsp.buf.rename)
vim.keymap.set("v", "<localleader>a", vim.lsp.buf.code_action)
vim.keymap.set("n", "<localleader>a", vim.lsp.buf.code_action)

-- others
vim.keymap.set("i", "<C-c>", "<ESC>")      -- C-c actually ESC
vim.keymap.set("i", "jj", "<ESC>")         -- jj in insert to ESC
vim.keymap.set("n", "!", ":!")             -- Shell commands
vim.keymap.set("n", "-", ":25Lex %:h<CR>") -- Cwd explorer
vim.keymap.set("n", "/", "/\\v")           -- Magic search
vim.keymap.set("n", "<BS>", ":b#<CR>")     -- Backspace jumps buffers
vim.keymap.set("n", "?", "?\\v")           -- Magic backwards search
vim.keymap.set("n", "Q", "@q")             -- One button macros
vim.keymap.set("n", "q:", ":q")            -- No q:

-- leader mappings
vim.keymap.set("n", "<leader>/", ":Telescope find_files<CR>")
vim.keymap.set("n", "<leader>;", ":Telescope commands<CR>")
vim.keymap.set("n", "<leader><CR>", ":")
-- vim.keymap.set("n", "<leader><leader>", ":")
vim.keymap.set("n", "<leader>a", ":te<CR>")
vim.keymap.set("n", "<leader>b", ":Telescope buffers<CR>")
vim.keymap.set("n", "<leader>c", ":Telescope lsp_dynamic_workspace_symbols<CR>")
vim.keymap.set("n", "<leader>d", ":25Lex<CR>")
vim.keymap.set("n", "<leader>e", ':e <C-R>=expand("%:p:h")<CR>/<C-n>')
vim.keymap.set("n", "<leader>f", ":Telescope git_files<CR>")
vim.keymap.set("n", "<leader>gd", ":Git diff origin/main...HEAD %<CR>")
vim.keymap.set("n", "<leader>gg", ":Git<CR>")
vim.keymap.set("n", "<leader>h", ":Telescope help_tags<CR>")
vim.keymap.set("n", "<leader>i", ":SnipRun<CR>")
vim.keymap.set("v", "<leader>i", ":SnipRun<CR>")
vim.keymap.set("n", "<leader>j", ":Neorg<CR>")
vim.keymap.set("n", "<leader>k", ":q<CR>")
vim.keymap.set("n", "<leader>ld", vim.diagnostic.open_float)
vim.keymap.set("n", "<leader>ll", vim.diagnostic.setqflist)
vim.keymap.set("n", "<leader>ln", vim.diagnostic.goto_next)
vim.keymap.set("n", "<leader>lp", vim.diagnostic.goto_prev)
vim.keymap.set("n", "<leader>m", ":Telescope oldfiles<CR>")
vim.keymap.set("n", "<leader>n", ":tabe<CR>")
vim.keymap.set("n", "<leader>p", ":cw<CR>")
vim.keymap.set("n", "<leader>q", ":qa<CR>")
vim.keymap.set("n", "<leader>r", ":%s/")
vim.keymap.set("n", "<leader>sh", ":vsplit<CR>")
vim.keymap.set("n", "<leader>sj", ":split<CR><C-w>j")
vim.keymap.set("n", "<leader>sk", ":split<CR>")
vim.keymap.set("n", "<leader>sl", ":vsplit<CR><C-w>l")
vim.keymap.set("n", "<leader>tt", ":TestNearest<CR>")
vim.keymap.set("n", "<leader>tf", ":TestFile<CR>")
vim.keymap.set("n", "<leader>ti", ":TestVisit<CR>")
vim.keymap.set("n", "<leader>va", ":e ~/dotfiles/.bash_aliases<CR>")
vim.keymap.set("n", "<leader>vd", ":e ~/local-init.lua<CR>")
vim.keymap.set("n", "<leader>vk", ":e ~/.config/kitty/kitty.conf<CR>")
vim.keymap.set("n", "<leader>vv", ":e ~/dotfiles/init.lua<CR>")
vim.keymap.set("n", "<leader>vl", ":e ./.nvim/init.lua<CR>")
vim.keymap.set("n", "<leader>vv", ":e ~/dotfiles/init.lua<CR>")
vim.keymap.set("n", "<leader>vz", ":e ~/dotfiles/.zshrc<CR>")
vim.keymap.set("n", "<leader>w", ":w<CR>")
vim.keymap.set("n", "<leader>y", ':let @+ = expand("%")<cr>')
vim.keymap.set("n", "<leader>z", function()
  if vim.wo.foldlevel > 0 then
    vim.wo.foldlevel = 0
  else
    vim.wo.foldlevel = 99
  end
end)


-- ------------------------------------------------------------------------------

-- XXX PACKAGES
vim.cmd([[packadd cfilter]])
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

vim.g.AutoPairsMapCR = 0
vim.g["test#strategy"] = "neovim"

require("lazy").setup({
  -- cosmetic
  'stevearc/dressing.nvim',      -- better UI
  "nvim-lualine/lualine.nvim",   -- status line
  'nvim-tree/nvim-web-devicons', -- devicons
  'mechatroner/rainbow_csv',     -- pretty csv
  "rebelot/kanagawa.nvim",
  -- lsp
  {
    'neovim/nvim-lspconfig',
    config = function()
      vim.api.nvim_create_autocmd('LspAttach', {
        desc = 'LSP actions',
        callback = function(event)
          local opts = { buffer = event.buf }

          vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
          vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
          vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
          vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
          vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
          vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
          vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
          vim.keymap.set('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
          vim.keymap.set({ 'n', 'x' }, '<F3>', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', opts)
          vim.keymap.set('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
        end
      })

      require('lspconfig').bashls.setup({})
      require('lspconfig').cssls.setup({})
      require('lspconfig').dockerls.setup({})
      require('lspconfig').elixirls.setup({})
      require('lspconfig').ember.setup({})
      require('lspconfig').emmet_ls.setup({})
      require('lspconfig').eslint.setup({})
      require('lspconfig').jsonls.setup({})
      require('lspconfig').lua_ls.setup({})
      require('lspconfig').pyright.setup({})
      require('lspconfig').rust_analyzer.setup({})
      require('lspconfig').terraformls.setup({})
      require('lspconfig').ts_ls.setup({})
    end
  },
  { 'williamboman/mason.nvim',           opts = {} },
  { 'williamboman/mason-lspconfig.nvim', opts = {} },
  -- autocompletion
  'hrsh7th/cmp-nvim-lsp',
  {
    'hrsh7th/nvim-cmp',
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
    },
    config = function()
      local cmp = require('cmp')
      cmp.setup({
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "path" },
        }, {
          { name = "buffer" },
        }),
        snippet = {
          expand = function(args)
            -- You need Neovim v0.10 to use vim.snippet
            vim.snippet.expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert({}),
      })
    end
  },
  -- testing
  "vim-test/vim-test",
  -- navigation
  'nvim-telescope/telescope.nvim',
  {
    "folke/flash.nvim", -- fast s and r
    keys = {
      { "s",     mode = { "n", "x", "o" }, function() require("flash").jump() end,              desc = "Flash" },
      { "S",     mode = { "n", "x", "o" }, function() require("flash").treesitter() end,        desc = "Flash Treesitter" },
      { "r",     mode = "o",               function() require("flash").remote() end,            desc = "Remote Flash" },
      { "R",     mode = { "o", "x" },      function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
      { "<c-s>", mode = { "c" },           function() require("flash").toggle() end,            desc = "Toggle Flash Search" },
    },
  },
  "stefandtw/quickfix-reflector.vim", -- edit quickfix search
  {
    "folke/which-key.nvim",           -- leader key hints
    opts = { triggers = { "<leader>", "<localleader>" } }
  },
  "nvim-treesitter/nvim-treesitter",
  -- util}
  "nvim-lua/plenary.nvim",                 -- async lib for plugins
  { 'windwp/nvim-autopairs',  opts = {} }, -- autopairs
  { "kylechui/nvim-surround", opts = {} }, -- ysiw
  "tpope/vim-rsi",                         -- emacs readline bindings
  "tpope/vim-fugitive",                    -- git
  "tpope/vim-rhubarb",                     -- github
  "tpope/vim-abolish",                     -- substitution
  "tpope/vim-vinegar",                     -- netrw improvements
  "tpope/vim-commentary",                  -- comments
  "tpope/vim-repeat",                      -- better .
  "tpope/vim-sensible",                    -- sensible defaults
  -- tools
  { "michaelb/sniprun",    branch = "master", build = "sh install.sh", opts = {} },
  { "folke/zen-mode.nvim", opts = {} },
  {
    "nvim-neorg/neorg",
    lazy = false, -- Disable lazy loading as some `lazy.nvim` distributions set `lazy = true` by default
    run = ":Neorg sync-parsers",
    config = function()
      require('neorg').setup {
        load = {
          ["core.defaults"] = {},
          ["core.concealer"] = {},
          ["core.presenter"] = { config = { zen_mode = "zen-mode" } },
          ["core.dirman"] = {
            config = {
              workspaces = {
                notes = "~/norg"
              },
              default_workspace = "notes"
            }
          },
        }
      }
    end
  }
})

vim.cmd('colo kanagawa')

vim.cmd([[filetype plugin indent on]])
vim.cmd([[syntax enable]])

--------------------------------------------------------------------------------

-- XXX AUTOCOMMANDS

-- vim.cmd [[au! FileType netrw nm <buffer> <C-l> <C-w>l]]
-- vim.cmd [[au! BufEnter *.heex setlocal ft=eelixir]]
-- vim.cmd [[au! BufEnter *.mdx setlocal ft=markdown]]
-- vim.cmd [[au! TermOpen * setlocal nonumber norelativenumber bufhidden=hide]]
-- vim.cmd [[au! FileType typescript,typescriptreact setlocal foldmethod=indent]]
-- vim.cmd [[au! FileType typescript,typescriptreact nn <localleader>i :lua require("typescript").actions.addMissingImports()<CR>]]
-- vim.cmd [[au! FileType typescript,typescriptreact nn <localleader>u :lua require("typescript").actions.removeUnused()<CR>]]
-- vim.cmd [[au! FileType typescript,typescriptreact nn <localleader>x :lua require("typescript").actions.fixAll()<CR>]]
-- vim.cmd [[au! BufEnter journal.md nn <C-n> <C-x>k ]]
-- vim.cmd [[au! BufEnter journal.md lua require('cmp').setup.buffer { enabled = false }]]
-- vim.cmd [[au! BufWritePre *.json,*.lua,*.tf lua vim.lsp.buf.format()]]
-- vim.cmd [[au! BufWritePre *.ts,*.tsx,*.js,*.jsx EslintFixAll]]
--------------------------------------------------------------------------------

-- XXX CONFIGS
-- Project config
if vim.fn.filereadable("./.nvim/init.lua") == 1 then
  dofile("./.nvim/init.lua")
end
-- Device config
-- if vim.fn.filereadable(os.getenv("home") .. "local-init.lua") == 1 then
--   dofile(os.getenv("home") .. "local-init.lua")
-- end
--
-- TODO
-- - snippets
-- - email
