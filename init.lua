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
vim.env.NVIM_LISTEN_address = "/tmp/nvim-" .. vim.env.USER
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

-- copy to local config for clerk
-- vim.cmd([[
-- function! ClerkShow()
--   exe "w"
--   exe "ConjureEval (nextjournal.clerk/show! \"" . expand("%:p") . "\")"
-- endfunction

-- nmap <silent> <localleader>cs :execute ClerkShow()<CR>
-- ]])

-- leader mappings
vim.keymap.set("n", "<leader>/", ":Telescope live_grep<CR>")
vim.keymap.set("n", "<leader>;", ":Telescope commands<CR>")
vim.keymap.set("n", "<leader><CR>", ":")
vim.keymap.set("n", "<leader>a", ":te<CR>")
vim.keymap.set("n", "<leader>b", ":Telescope buffers<CR>")
vim.keymap.set("n", "<leader>c", ":Telescope lsp_dynamic_workspace_symbols<CR>")
vim.keymap.set("n", "<leader>d", ":25vsplit .<CR>")
vim.keymap.set("n", "<leader>e", ':e <C-R>=expand("%:p:h")<CR>/<C-n>')
vim.keymap.set("n", "<leader>f", ":Telescope git_files<CR>")
vim.keymap.set("n", "<leader>gd", ":Git diff origin/main...HEAD %<CR>")
vim.keymap.set("n", "<leader>gg", ":Git<CR>")
vim.keymap.set("n", "<leader>h", ":Telescope help_tags<CR>")
vim.keymap.set("n", "<leader>i", ":SnipRun<CR>")
vim.keymap.set("v", "<leader>i", ":SnipRun<CR>")
vim.keymap.set("n", "<leader>j", ":Telescope current_buffer_fuzzy_find<CR>")
vim.keymap.set("n", "<leader>k", ":q<CR>")
vim.keymap.set("n", "<leader>ld", vim.diagnostic.open_float)
vim.keymap.set("n", "<leader>ll", vim.diagnostic.setqflist)
vim.keymap.set("n", "<leader>ln", vim.diagnostic.goto_next)
vim.keymap.set("n", "<leader>lp", vim.diagnostic.goto_prev)
vim.keymap.set("n", "<leader>m", ":Telescope oldfiles<CR>")
vim.keymap.set("n", "<leader>n", ":tabe<CR>")
vim.keymap.set("n", "<leader>oa", function() require("opencode").ask("@this: ", { submit = true }) end,
  { desc = "Ask opencode…" })
vim.keymap.set("n", "<leader>os", function() require("opencode").select() end, { desc = "Execute opencode action…" })
vim.keymap.set("n", "<leader>oo", function() require("opencode").toggle() end, { desc = "Toggle opencode" })
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
vim.keymap.set("n", "<leader>uo", ":ObsidianOpen<CR>")
vim.keymap.set("n", "<leader>uu", ":ObsidianSearch<CR>")
vim.keymap.set("n", "<leader>va", ":e ~/dotfiles/.bash_aliases<CR>")
vim.keymap.set("n", "<leader>vd", ":e ~/local-init.lua<CR>")
vim.keymap.set("n", "<leader>vl", ":e ./.nvim/init.lua<CR>")
vim.keymap.set("n", "<leader>vti", ":e ~/things/wiki/index.md<CR>")
vim.keymap.set("n", "<leader>vtt", ":e ~/things/wiki/tasks.md<CR>")
vim.keymap.set("n", "<leader>vv", ":e ~/dotfiles/init.lua<CR>")
vim.keymap.set("n", "<leader>vz", ":e ~/dotfiles/.zshrc<CR>")
vim.keymap.set("n", "<leader>w", ":w<CR>")
vim.keymap.set("n", "<leader>x", ":Zen<CR>")
vim.keymap.set("n", "<leader>y", ':let @+ = expand("%")<cr>')
vim.keymap.set("n", "<leader>z", function()
  if vim.wo.foldlevel > 0 then
    vim.wo.foldlevel = 0
  else
    vim.wo.foldlevel = 99
  end
end)

-- -- obsidian
-- vim.keymap.set("n", "<leader>oo", ":ObsidianOpen<CR>")
-- vim.keymap.set("n", "<leader>os", ":ObsidianSearch<CR>")
-- vim.keymap.set("n", "<leader>ot", ":ObsidianTOC<CR>")

-- XXX PACKAGES (vim.pack - Neovim's built-in plugin manager)
-- Install plugins by running :sync (or vim.pack.start())
-- Note: vim.pack doesn't support lazy loading
vim.pack.add({
  -- cosmetic
  { src = 'https://github.com/stevearc/dressing.nvim' },
  { src = 'https://github.com/nvim-lualine/lualine.nvim' },
  { src = 'https://github.com/nvim-tree/nvim-web-devicons' },
  { src = 'https://github.com/mechatroner/rainbow_csv' },
  { src = 'https://github.com/goolord/alpha-nvim' },
  { src = 'https://github.com/nvim-mini/mini.icons' },
  { src = 'https://github.com/kivanceski/rsvp.nvim' },
  -- lsp (mason is also added as standalone)
  { src = 'https://github.com/neovim/nvim-lspconfig' },
  { src = 'https://github.com/williamboman/mason.nvim' },
  { src = 'https://github.com/williamboman/mason-lspconfig.nvim' },
  { src = 'https://github.com/b0o/schemastore.nvim' },
  -- formatting
  { src = 'https://github.com/stevearc/conform.nvim' },
  -- linting
  { src = 'https://github.com/mfussenegger/nvim-lint' },
  -- testing
  { src = 'https://github.com/vim-test/vim-test' },
  -- navigation
  { src = 'https://github.com/nvim-telescope/telescope.nvim' },
  { src = 'https://github.com/folke/flash.nvim' },
  { src = 'https://github.com/stefandtw/quickfix-reflector.vim' },
  { src = 'https://github.com/folke/which-key.nvim' },
  -- treesitter
  { src = 'https://github.com/nvim-treesitter/nvim-treesitter',  branch = 'main' },
  -- lang
  { src = 'https://github.com/elixir-editors/vim-elixir' },
  { src = 'https://github.com/Olical/conjure' },
  -- { src = 'https://github.com/PaterJason/cmp-conjure' }, -- requires nvim-cmp
  { src = 'https://github.com/clojure-vim/vim-jack-in' },
  { src = 'https://github.com/tpope/vim-dispatch' },
  { src = 'https://github.com/radenling/vim-dispatch-neovim' },
  { src = 'https://github.com/bullets-vim/bullets.vim' },
  -- util
  { src = 'https://github.com/nvim-lua/plenary.nvim' },
  { src = 'https://github.com/windwp/nvim-autopairs' },
  { src = 'https://github.com/kylechui/nvim-surround' },
  { src = 'https://github.com/tpope/vim-rsi' },
  { src = 'https://github.com/tpope/vim-fugitive' },
  { src = 'https://github.com/tpope/vim-rhubarb' },
  { src = 'https://github.com/tpope/vim-abolish' },
  { src = 'https://github.com/tpope/vim-commentary' },
  { src = 'https://github.com/tpope/vim-repeat' },
  { src = 'https://github.com/tpope/vim-sensible' },
  { src = 'https://github.com/stevearc/oil.nvim' },
  { src = 'https://github.com/folke/snacks.nvim' },
  -- tools
  { src = 'https://github.com/michaelb/sniprun',                 branch = 'master' },
  { src = 'https://github.com/folke/zen-mode.nvim' },
  -- obsidian
  { src = 'https://github.com/epwalsh/obsidian.nvim',            tag = 'v3.9.0' },
  -- AI
  { src = 'https://github.com/nickjvandyke/opencode.nvim',       branch = 'main' },
  -- snippets
  { src = 'https://github.com/L3MON4D3/LuaSnip' },
  { src = 'https://github.com/rafamadriz/friendly-snippets' },
  { src = 'https://github.com/saadparwaiz1/cmp_luasnip' },
  -- completion
  { src = 'https://github.com/hrsh7th/nvim-cmp' },
  { src = 'https://github.com/hrsh7th/cmp-nvim-lsp' },
  { src = 'https://github.com/hrsh7th/cmp-buffer' },
  { src = 'https://github.com/hrsh7th/cmp-path' },
})

vim.g.AutoPairsMapCR = 0
vim.g["test#strategy"] = "asyncrun"

-- Enable nvim-cmp for completion
vim.opt.completeopt = "menu,menuone,noselect"

-- nvim-cmp setup
local cmp = require("cmp")
local luasnip = require("luasnip")

require("luasnip.loaders.from_vscode").lazy_load()
require("luasnip.loaders.from_snipmate").lazy_load({ paths = { "~/dotfiles/snippets" } })

cmp.setup({
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ["<C-b>"] = cmp.mapping.scroll_docs(-4),
    ["<C-f>"] = cmp.mapping.scroll_docs(4),
    ["<C-Space>"] = cmp.mapping.complete(),
    ["<C-e>"] = cmp.mapping.abort(),
    ["<CR>"] = cmp.mapping.confirm({ select = true }),
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
  }),
  sources = cmp.config.sources({
    { name = "nvim_lsp" },
    { name = "luasnip" },
    { name = "path" },
  }, {
    { name = "buffer" },
  }),
})

-- Enable UI2 (new command line UI)
require('vim._core.ui2').enable({})

-- LSP Configuration
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").default_capabilities()
vim.lsp.config("*", { capabilities = capabilities })

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
}

require("mason-lspconfig").setup {
  ensure_installed = {
    "bashls",
    "clojure_lsp",
    "cssls",
    "dockerls",
    "elixirls",
    "ember",
    "emmet_ls",
    "eslint",
    "jsonls",
    "lua_ls",
    "pyright",
    "rust_analyzer",
    "terraformls",
    "ts_ls",
  },
}

-- LSP server configurations
local servers = {
  { "bashls" },
  { "clojure_lsp" },
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
    on_attach = function(_, bufnr)
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

for _, server in ipairs(servers) do
  local name = server[1]
  local config = server[2]
  if config then
    vim.lsp.config(name, config)
  end
  vim.lsp.enable(name)
end

-- Alpha config
require 'alpha'.setup(require 'alpha.themes.theta'.config)

-- Telescope setup
local telescope = require('telescope')
telescope.setup({
  defaults = {
    prompt_prefix = ' ',
    selection_caret = ' ',
    path_display = { 'smart' },
    file_ignore_patterns = { '.git/', 'node_modules/' },
  },
})

-- Flash.nvim
require('flash').setup()
vim.keymap.set({ "n", "x", "o" }, "s", function() require("flash").jump() end, { desc = "Flash" })
vim.keymap.set({ "n", "x", "o" }, "S", function() require("flash").treesitter() end, { desc = "Flash Treesitter" })
vim.keymap.set("o", "r", function() require("flash").remote() end, { desc = "Remote Flash" })
vim.keymap.set({ "o", "x" }, "R", function() require("flash").treesitter_search() end, { desc = "Treesitter Search" })
vim.keymap.set("c", "<c-s>", function() require("flash").toggle() end, { desc = "Toggle Flash Search" })

-- Telescope keymaps
vim.keymap.set("n", "<leader>/", ":Telescope live_grep<CR>")
vim.keymap.set("n", "<leader>;", ":Telescope commands<CR>")
vim.keymap.set("n", "<leader>b", ":Telescope buffers<CR>")
vim.keymap.set("n", "<leader>c", ":Telescope lsp_dynamic_workspace_symbols<CR>")
vim.keymap.set("n", "<leader>f", ":Telescope git_files<CR>")
vim.keymap.set("n", "<leader>h", ":Telescope help_tags<CR>")
vim.keymap.set("n", "<leader>j", ":Telescope current_buffer_fuzzy_find<CR>")
vim.keymap.set("n", "<leader>m", ":Telescope oldfiles<CR>")

-- vim-test keymaps
vim.keymap.set("n", "<leader>tt", ":TestNearest<CR>")
vim.keymap.set("n", "<leader>tf", ":TestFile<CR>")
vim.keymap.set("n", "<leader>ti", ":TestVisit<CR>")

-- Sniprun keymaps
vim.keymap.set("n", "<leader>i", ":SnipRun<CR>")
vim.keymap.set("v", "<leader>i", ":SnipRun<CR>")

-- Which-key extra keymap
vim.keymap.set("n", "<leader>?", function()
  require("which-key").show { global = false }
end, { desc = "Buffer Local Keymaps (which-key)" })

-- Lualine setup
require('lualine').setup({
  options = {
    component_separators = '|',
    section_separators = '',
  },
})

-- Conform (formatting)
require("conform").setup({
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
})

-- nvim-lint
local lint = require "lint"

lint.linters_by_ft = {
  javascript = { "eslint" },
  javascriptreact = { "eslint" },
  typescript = { "eslint" },
  typescriptreact = { "eslint" },
  python = { "ruff" },
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

-- Treesitter
require("nvim-treesitter").setup {
  ensure_installed = {
    "bash",
    "c",
    "clojure",
    "comment",
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

-- Which-key
require("which-key").setup {
  preset = "modern",
  spec = {
    { "<leader>l", group = "diagnostics" },
    { "<leader>v", group = "vim config" },
    { "<leader>s", group = "splits" },
    { "<leader>t", group = "tests" },
    { "<leader>g", group = "git" },
  },
}

-- Autopairs
require("nvim-autopairs").setup {}

-- nvim-surround
require("nvim-surround").setup {}

-- oil.nvim
require("oil").setup {}

-- zen-mode
require("zen-mode").setup { window = { width = 60 } }

-- snacks.nvim
require("snacks").setup()

-- opencode.nvim
vim.g.opencode_opts = {}
vim.o.autoread = true

-- nvim-snippets (disabled - requires nvim-cmp)
-- require("snippets").setup({
--   search_paths = { "~/dotfiles/snippets" },
-- })

-- obsidian.nvim
require("obsidian").setup({
  workspaces = {
    {
      name = "wiki",
      path = "~/things/wiki",
    },
  },
  note_frontmatter_func = function(note)
    return {
      id = note.id,
      tags = note.tags,
    }
  end,
})

vim.cmd([[filetype plugin indent on]])
vim.cmd([[syntax enable]])
vim.o.background = "dark"
vim.cmd([[colorscheme default]])

-- XXX CONFIGS
-- Project config
if vim.fn.filereadable("./.nvim/init.lua") == 1 then
  dofile("./.nvim/init.lua")
end
