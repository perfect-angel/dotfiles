--- @diagnostic disable: undefined-global, redundant-parameter
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
vim.g.qf_join_changes = true
vim.o.hlsearch = false
vim.o.expandtab = true
vim.o.tabstop = 4
vim.o.shiftwidth = 2
vim.o.timeout = true
vim.o.timeoutlen = 300
vim.o.swapfile = false
vim.o.textwidth = 60
vim.o.grepprg = "rg --vimgrep --no-heading --smart-case"
vim.o.autochdir = false
vim.o.clipboard = "unnamedplus"
vim.o.foldmethod = "expr"
vim.o.wrap = false
vim.o.foldlevel = 99
vim.o.foldexpr = "nvim_treesitter#foldexpr()"
vim.o.ignorecase = true
vim.o.smartcase = true
vim.g.netrw_banner = 0
vim.o.conceallevel = 2
vim.o.concealcursor = "nc"
vim.o.background = "light"

-- XXX KEYMAPPINGS
vim.g.mapleader = " "
vim.g.maplocalleader = ","

-- tabs
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

-- others
vim.keymap.set("i", "<C-c>", "<ESC>")
vim.keymap.set("i", "jj", "<ESC>")
vim.keymap.set("n", "!", ":!")
vim.keymap.set("n", "-", ":25Lex %:h<CR>")
vim.keymap.set("n", "/", "/\\v")
vim.keymap.set("n", "<BS>", ":b#<CR>")
vim.keymap.set("n", "?", "?\\v")
vim.keymap.set("n", "Q", "@q")
vim.keymap.set("n", "q:", ":q")

-- leader mappings
vim.keymap.set("n", "<leader>/", ":Telescope live_grep<CR>")
vim.keymap.set("n", "<leader>;", ":Telescope commands<CR>")
vim.keymap.set("n", "<leader><CR>", ":")
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
vim.keymap.set("n", "<leader>j", ":Telescope current_buffer_fuzzy_find")
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
vim.keymap.set("n", "<leader>vv", ":e ~/dotfiles/init.lua<CR>")
vim.keymap.set("n", "<leader>vl", ":e ./.nvim/init.lua<CR>")
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

-- XXX PACKAGES
vim.cmd([[packadd cfilter]])
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

vim.g.AutoPairsMapCR = 0
vim.g["test#strategy"] = "asyncrun"

require("lazy").setup({
  -- cosmetic
  "stevearc/dressing.nvim",
  "nvim-lualine/lualine.nvim",
  "nvim-tree/nvim-web-devicons",
  "mechatroner/rainbow_csv",
  -- lsp
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
      "hrsh7th/cmp-nvim-lsp",
      "b0o/schemastore.nvim",
    },
    config = function()
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())

      vim.api.nvim_create_autocmd("LspAttach", {
        desc = "LSP actions",
        callback = function(event)
          local opts = { buffer = event.buf }

          vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
          vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
          vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
          vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
          vim.keymap.set("n", "go", vim.lsp.buf.type_definition, opts)
          vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
          vim.keymap.set("n", "gs", vim.lsp.buf.signature_help, opts)
          vim.keymap.set("n", "<F2>", vim.lsp.buf.rename, opts)
          vim.keymap.set({ "n", "x" }, "<F3>", function()
            vim.lsp.buf.format { async = true }
          end, opts)
          vim.keymap.set("n", "<F4>", vim.lsp.buf.code_action, opts)
        end,
      })

      vim.diagnostic.config {
        virtual_text = {
          prefix = "●",
          spacing = 2,
        },
        signs = true,
        underline = true,
        update_in_insert = false,
        severity_sort = true,
        float = {
          border = "rounded",
          source = true,
          header = "",
          prefix = "",
        },
      }

      vim.lsp.handlers["textDocument/hover"] = function(_, result, _, config)
        if result and result.contents then
          vim.lsp.util.open_floating_preview(result.contents, nil, vim.tbl_extend("force", {
            border = "rounded",
            silent = true,
          }, config or {}))
        end
      end

      vim.lsp.handlers["textDocument/signatureHelp"] = function(_, result, _, config)
        if not result or not result.signatures or #result.signatures == 0 then
          return
        end
        local markdown_lines = vim.lsp.util.convert_signature_help_to_markdown_lines(result, vim.bo.filetype, {
          markdown = { "markdown" },
        })
        if markdown_lines and #markdown_lines > 0 then
          vim.lsp.util.open_floating_preview(markdown_lines, "markdown", vim.tbl_extend("force", {
            border = "rounded",
          }, config or {}))
        end
      end

      vim.api.nvim_create_autocmd("LspAttach", {
        desc = "Enable inlay hints",
        callback = function(args)
          local client = vim.lsp.get_client_by_id(args.data.client_id)
          if client and client.server_capabilities.inlayHintProvider then
            vim.lsp.inlay_hint.enable(true, { bufnr = args.buf })
          end
        end,
      })

      require("mason").setup {
        ui = {
          border = "rounded",
          icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗",
          },
        },
        ensure_installed = {
          "bash-language-server",
          "css-lsp",
          "dockerfile-language-server",
          "elixir-ls",
          "ember-language-server",
          "emmet-ls",
          "eslint-lsp",
          "json-lsp",
          "lua-language-server",
          "pyright",
          "rust-analyzer",
          "terraform-ls",
          "typescript-language-server",
        },
      }

      -- LSP server configurations using vim.lsp.config
      local servers = {
        { "bashls" },
        {
          "cssls",
          settings = {
            css = { validate = true },
            scss = { validate = true },
            less = { validate = true },
          },
        },
        { "dockerls" },
        {
          "elixirls",
          cmd = { "elixir-ls" },
        },
        { "ember" },
        {
          "emmet_ls",
          filetypes = {
            "html",
            "typescriptreact",
            "javascriptreact",
            "css",
            "sass",
            "scss",
            "less",
            "svelte",
            "vue",
          },
        },
        {
          "eslint",
          on_attach = function(client, bufnr)
            vim.api.nvim_create_autocmd("BufWritePre", {
              buffer = bufnr,
              command = "EslintFixAll",
            })
          end,
        },
        {
          "jsonls",
          settings = {
            json = {
              schemas = require("schemastore").json.schemas(),
              validate = { enable = true },
            },
          },
        },
        {
          "lua_ls",
          settings = {
            Lua = {
              diagnostics = {
                globals = { "vim" },
              },
              workspace = {
                library = vim.api.nvim_get_runtime_file("", true),
                checkThirdParty = false,
              },
              telemetry = { enable = false },
              hint = { enable = true },
            },
          },
        },
        {
          "pyright",
          settings = {
            python = {
              analysis = {
                typeCheckingMode = "basic",
                autoSearchPaths = true,
                useLibraryCodeForTypes = true,
              },
            },
          },
        },
        {
          "rust_analyzer",
          settings = {
            ["rust-analyzer"] = {
              check = { command = "clippy" },
              cargo = { loadOutDirsFromCheck = true },
              procMacro = { enable = true },
            },
          },
        },
        { "terraformls" },
        {
          "ts_ls",
          init_options = {
            plugins = {
              {
                name = "@vue/typescript-plugin",
                location = vim.fn.stdpath "data" ..
                    "/mason/packages/vue-language-server/node_modules/@vue/language-server",
                languages = { "vue" },
              },
            },
          },
          filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" },
        },
      }

      -- Set shared capabilities for all servers
      vim.lsp.config("*", { capabilities = capabilities })

      -- Configure and enable each server
      for _, server in ipairs(servers) do
        local name = server[1]
        local config = server[2]
        if config then
          vim.lsp.config(name, config)
        end
        vim.lsp.enable(name)
      end
    end,
  },
  -- formatting
  {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
    keys = {
      {
        "<F3>",
        function()
          require("conform").format { async = true, lsp_format = "fallback" }
        end,
        mode = { "n", "v" },
        desc = "Format buffer",
      },
    },
    opts = {
      format_on_save = {
        timeout_ms = 1000,
        lsp_format = "fallback",
      },
      formatters_by_ft = {
        lua = { "stylua" },
        python = { "ruff_format", "ruff_fix" },
        javascript = { "prettierd", "prettier", stop_after_first = true },
        javascriptreact = { "prettierd", "prettier", stop_after_first = true },
        typescript = { "prettierd", "prettier", stop_after_first = true },
        typescriptreact = { "prettierd", "prettier", stop_after_first = true },
        css = { "prettierd", "prettier", stop_after_first = true },
        html = { "prettierd", "prettier", stop_after_first = true },
        json = { "prettierd", "prettier", stop_after_first = true },
        yaml = { "prettierd", "prettier", stop_after_first = true },
        markdown = { "prettierd", "prettier", stop_after_first = true },
        rust = { "rustfmt" },
        elixir = { "mix" },
        terraform = { "terraform_fmt" },
      },
      default_format_opts = {
        lsp_format = "fallback",
      },
    },
  },
  -- linting
  {
    "mfussenegger/nvim-lint",
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      local lint = require "lint"

      lint.linters_by_ft = {
        javascript = { "eslint" },
        javascriptreact = { "eslint" },
        typescript = { "eslint" },
        typescriptreact = { "eslint" },
        python = { "ruff" },
        lua = { "luacheck" },
        terraform = { "terraform_validate" },
        dockerfile = { "hadolint" },
      }

      local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })
      vim.api.nvim_create_autocmd({ "BufWritePost", "BufReadPost", "InsertLeave" }, {
        group = lint_augroup,
        callback = function()
          lint.try_lint()
        end,
      })
    end,
  },
  -- autocompletion
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
      "rafamadriz/friendly-snippets",
    },
    config = function()
      local cmp = require "cmp"
      local luasnip = require "luasnip"

      require("luasnip.loaders.from_vscode").lazy_load()

      cmp.setup {
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        },
        mapping = cmp.mapping.preset.insert {
          ["<C-b>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<C-e>"] = cmp.mapping.abort(),
          ["<CR>"] = cmp.mapping.confirm { select = true },
          ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
              luasnip.expand_or_jump()
            else
              fallback()
            end
          end, { "i", "s" }),
          ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end, { "i", "s" }),
        },
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "luasnip" },
          { name = "path" },
        }, {
          { name = "buffer" },
        }),
      }
    end,
  },
  -- testing
  "vim-test/vim-test",
  -- navigation
  "nvim-telescope/telescope.nvim",
  {
    "folke/flash.nvim",
    keys = {
      { "s",     mode = { "n", "x", "o" }, function() require("flash").jump() end,              desc = "Flash" },
      { "S",     mode = { "n", "x", "o" }, function() require("flash").treesitter() end,        desc = "Flash Treesitter" },
      { "r",     mode = "o",               function() require("flash").remote() end,            desc = "Remote Flash" },
      { "R",     mode = { "o", "x" },      function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
      { "<c-s>", mode = { "c" },           function() require("flash").toggle() end,            desc = "Toggle Flash Search" },
    },
  },
  "stefandtw/quickfix-reflector.vim",
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
      preset = "modern",
      spec = {
        { "<leader>l", group = "diagnostics" },
        { "<leader>v", group = "vim config" },
        { "<leader>s", group = "splits" },
        { "<leader>t", group = "tests" },
        { "<leader>g", group = "git" },
      },
    },
    keys = {
      {
        "<leader>?",
        function()
          require("which-key").show { global = false }
        end,
        desc = "Buffer Local Keymaps (which-key)",
      },
    },
  },
  -- lang
  {
    "nvim-treesitter/nvim-treesitter",
    config = function()
      require("nvim-treesitter").setup {
        ensure_installed = {
          "bash",
          "c",
          "css",
          "dockerfile",
          "elixir",
          "heex",
          "html",
          "javascript",
          "json",
          "lua",
          "markdown",
          "markdown_inline",
          "python",
          "rust",
          "terraform",
          "typescript",
          "vim",
          "vimdoc",
          "vue",
          "yaml",
        },
        auto_install = true,
        highlight = { enable = true },
        indent = { enable = true },
        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = "<C-Space>",
            node_incremental = "<C-Space>",
            scope_incremental = false,
            node_decremental = "<bs>",
          },
        },
      }
    end,
  },
  "elixir-editors/vim-elixir",
  -- org
  {
    "nvim-orgmode/orgmode",
    event = "VeryLazy",
    ft = { "org" },
    config = function()
      require("orgmode").setup {
        org_agenda_files = { "~/org/**/*" },
        org_default_notes_file = "~/org/refile.org",
        org_adapt_indentation = false,
        org_capture_templates = {
          t = { description = "Task", template = "* TODO %?", target = { "~/org/tasks.org" } },
          j = {
            description = "Journal",
            target = { "~/org/journal.org" },
            template = "%?",
            datetree = true,
          },
        },
      }
    end,
  },
  {
    "chipsenkbeil/org-roam.nvim",
    opts = {
      directory = "~/org/words",
      org_files = { "~/org" },
    },
  },
  "bullets-vim/bullets.vim",
  -- util
  "nvim-lua/plenary.nvim",
  { "windwp/nvim-autopairs",  opts = {} },
  { "kylechui/nvim-surround", opts = {} },
  "tpope/vim-rsi",
  "tpope/vim-fugitive",
  "tpope/vim-rhubarb",
  "tpope/vim-abolish",
  "tpope/vim-vinegar",
  "tpope/vim-commentary",
  "tpope/vim-repeat",
  "tpope/vim-sensible",
  -- tools
  { "michaelb/sniprun",    branch = "master",                 build = "sh install.sh", opts = {} },
  { "folke/zen-mode.nvim", opts = { window = { width = 60 } } },
})

vim.cmd([[filetype plugin indent on]])
vim.cmd([[syntax enable]])
vim.cmd([[colo habamax]])

-- XXX CONFIGS
-- Project config
if vim.fn.filereadable("./.nvim/init.lua") == 1 then
  dofile("./.nvim/init.lua")
end
