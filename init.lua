-- ==*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=
-- *=*=*=*=*=*=*=*=*=*=*=*=*=*=*==*=COLBY=DEHART'S=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=
-- *=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=WONDERFUL=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=
-- *=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=HORRIBLE*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=
-- *=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=INIT.LUA*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=
-- *=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=*=

-- Settings
vim.o.clipboard = "unnamedplus"
vim.o.termguicolors = true
vim.o.hidden = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.wildignorecase = true
vim.o.timeoutlen = 500
vim.o.number = true
vim.o.mouse="a"
vim.o.hlsearch = false
vim.o.relativenumber = true
vim.o.foldmethod = "expr"
vim.o.foldexpr = "nvim_treesitter#foldexpr()"
vim.o.foldlevel = 99
vim.o.grepprg = "rg --vimgrep --no-heading --smart-case"
vim.g.mapleader = ' '
vim.g.maplocalleader = ','
vim.g.python3_host_prog = "~/.config/nvim/venv/bin/python"



vim.diagnostic.config({
    virtual_text = false,
    signs = true,
    float = { border = "single" },
})

-- Ignore
vim.opt.wildignore = {
  "*/_build",
  "*.pyc",
  "*/node_modules/*",
  ".git",
  ".venv",
  "*.bs.js",
  ".DS_Store",
}


-- Packages
require('packer').startup(function()
  use 'wbthomason/packer.nvim'

  -- Cosmetic
  use 'mechatroner/rainbow_csv'
  use 'bluz71/vim-moonfly-colors'
  use 'savq/melange'
  use {'catppuccin/nvim', as = 'catpuccin'}
  use  'nvim-lualine/lualine.nvim'
  require('lualine').setup({ 
    options = {
      theme = "catppuccin",
      section_separators = { left = '', right = '' },
      component_separators = { left = '', right = '' }
    }
  })
  require("catppuccin").setup()

  -- Testing
  use 'vim-test/vim-test'
  use 'rcarriga/vim-ultest'
  vim.g["test#strategy"] = "dispatch"
  vim.g.ultest_use_pty = 1
  vim.g.ultest_output_on_line = 0

  -- Python
  use 'psf/black'
  vim.cmd  [[autocmd BufWritePre *.py execute 'silent :Black']]
  use 'fisadev/vim-isort'
  vim.cmd  [[autocmd BufWritePre *.py execute 'silent :Isort']]

  -- LSP
  use 'neovim/nvim-lspconfig'
  use 'williamboman/nvim-lsp-installer'
  use 'tamago324/nlsp-settings.nvim'
  use "ray-x/lsp_signature.nvim"
  require("lsp_signature").setup({})
  local lsp = require'lspconfig'
  lsp.pyright.setup{}
  lsp.bashls.setup{}
  lsp.dockerls.setup{}
  lsp.elixirls.setup{
    cmd = {vim.fn.expand("~/.local/share/nvim/lsp_servers/elixir/elixir-ls/language_server.sh")}
  }
  lsp.jsonls.setup{
    cmd = {"vscode-json-languageserver", "--stdio"}
  }
  lsp.pyright.setup{}
  lsp.sqlls.setup{}
  lsp.terraformls.setup{}
  lsp.tsserver.setup{}
  lsp.tailwindcss.setup{}
  -- Navigation
  use 'nvim-lua/plenary.nvim'
  use 'nvim-telescope/telescope.nvim'
  use 'kyazdani42/nvim-tree.lua'
  use 'ryanoasis/vim-devicons'
  use 'glepnir/dashboard-nvim'
  use 'nvim-lua/popup.nvim'
  use {'ggandor/lightspeed.nvim', 
    config = function() require('lightspeed').setup{ ignore_case = true } end
  }
  use "folke/which-key.nvim"
  require('nvim-tree').setup{ view = { side = 'right' }, git = { enable = false} }
  vim.g.dashboard_default_executive = 'telescope'
  vim.g.dashboard_custom_footer = {"Destroy things with neovim"}
  vim.g.dashboard_custom_header = {
    '     ⠀⠀⠀⠀⠀⠀⠀⡴⠞⠉⢉⣭⣿⣿⠿⣳⣤⠴⠖⠛⣛⣿⣿⡷⠖⣶⣤⡀⠀⠀⠀  ',
    '   ⠀⠀⠀⠀⠀⠀⠀⣼⠁⢀⣶⢻⡟⠿⠋⣴⠿⢻⣧⡴⠟⠋⠿⠛⠠⠾⢛⣵⣿⠀⠀⠀⠀  ',
    '   ⣼⣿⡿⢶⣄⠀⢀⡇⢀⡿⠁⠈⠀⠀⣀⣉⣀⠘⣿⠀⠀⣀⣀⠀⠀⠀⠛⡹⠋⠀⠀⠀⠀  ',
    '   ⣭⣤⡈⢑⣼⣻⣿⣧⡌⠁⠀⢀⣴⠟⠋⠉⠉⠛⣿⣴⠟⠋⠙⠻⣦⡰⣞⠁⢀⣤⣦⣤⠀  ',
    '   ⠀⠀⣰⢫⣾⠋⣽⠟⠑⠛⢠⡟⠁⠀⠀⠀⠀⠀⠈⢻⡄⠀⠀⠀⠘⣷⡈⠻⣍⠤⢤⣌⣀  ',
    '   ⢀⡞⣡⡌⠁⠀⠀⠀⠀⢀⣿⠁⠀⠀⠀⠀⠀⠀⠀⠀⢿⡀⠀⠀⠀⠸⣇⠀⢾⣷⢤⣬⣉  ',
    '   ⡞⣼⣿⣤⣄⠀⠀⠀⠀⢸⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⡇⠀⠀⠀⠀⣿⠀⠸⣿⣇⠈⠻  ',
    '   ⢰⣿⡿⢹⠃⠀⣠⠤⠶⣼⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⡇⠀⠀⠀⠀⣿⠀⠀⣿⠛⡄⠀  ',
    '   ⠈⠉⠁⠀⠀⠀⡟⡀⠀⠈⡗⠲⠶⠦⢤⣤⣤⣄⣀⣀⣸⣧⣤⣤⠤⠤⣿⣀⡀⠉⣼⡇⠀  ',
    '   ⣿⣴⣴⡆⠀⠀⠻⣄⠀⠀⠡⠀⠀⠀⠈⠛⠋⠀⠀⠀⡈⠀⠻⠟⠀⢀⠋⠉⠙⢷⡿⡇⠀  ',
    '   ⣻⡿⠏⠁⠀⠀⢠⡟⠀⠀⠀⠣⡀⠀⠀⠀⠀⠀⢀⣄⠀⠀⠀⠀⢀⠈⠀⢀⣀⡾⣴⠃⠀  ',
    '   ⢿⠛⠀⠀⠀⠀⢸⠁⠀⠀⠀⠀⠈⠢⠄⣀⠠⠼⣁⠀⡱⠤⠤⠐⠁⠀⠀⣸⠋⢻⡟⠀⠀  ',
    '   ⠈⢧⣀⣤⣶⡄⠘⣆⠀⠀⠀⠀⠀⠀⠀⢀⣤⠖⠛⠻⣄⠀⠀⠀⢀⣠⡾⠋⢀⡞⠀⠀⠀  ',
    '   ⠀⠀⠻⣿⣿⡇⠀⠈⠓⢦⣤⣤⣤⡤⠞⠉⠀⠀⠀⠀⠈⠛⠒⠚⢩⡅⣠⡴⠋⠀⠀⠀⠀  ',
    '   ⠀⠀⠀⠈⠻⢧⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠐⣻⠿⠋⠀⠀⠀⠀⠀⠀  ',
    '   ⠀⠀⠀⠀⠀⠀⠉⠓⠶⣤⣄⣀⡀⠀⠀⠀⠀⠀⢀⣀⣠⡴⠖⠋⠁⠀⠀⠀⠀⠀⠀⠀⠀  '
  }

  -- Completion
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/nvim-cmp'
  use 'dcampos/nvim-snippy'
  use 'dcampos/cmp-snippy'

  require('cool_cmp')

  -- Utility
  use 'windwp/nvim-autopairs'
  require('nvim-autopairs').setup{}
  use 'jpalardy/vim-slime'
  vim.g.slime_target = "neovim"
  -- Change this to use slime with ipython
  vim.g.slime_python_ipython = 0
  use 'tpope/vim-rsi' -- emacs readline bindings
  use 'tpope/vim-fugitive' -- git
  use 'tpope/vim-rhubarb' -- github
  use 'tpope/vim-abolish' -- substitution
  use 'tpope/vim-dadbod' -- databases
  use 'kristijanhusak/vim-dadbod-ui'
  use 'kristijanhusak/vim-dadbod-completion'
  use 'tpope/vim-dispatch' -- used by other plugins
  use 'radenling/vim-dispatch-neovim' -- no one knows
  -- use 'tpope/vim-vinegar' -- netrw+
  use 'tpope/vim-surround' -- ysiw 
  use 'tpope/vim-commentary' -- comments
  use 'tpope/vim-repeat' -- better .
  use 'tpope/vim-sensible' -- good defaults
  use 'sheerun/vim-polyglot' -- all languages
  use {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
  }
  
  vim.g.AutoPairsMapCR = 0
  vim.g.neoterm_repl_enable_ipython_paste_magic = 1
  vim.cmd [[au! FileType fugitive nm <buffer> <TAB> =]]
  vim.cmd [[au! BufEnter *.heex setlocal ft=eelixir]]

  local cmp_autopairs = require('nvim-autopairs.completion.cmp')
  require('cmp').event:on( 'confirm_done', cmp_autopairs.on_confirm_done({  map_char = { tex = '' } }))


  -- Web
  use 'stephenway/postcss.vim'
  use 'mattn/emmet-vim'
  vim.g.user_emmet_settings = {
    javascript = {extends = 'jsx'},
    javascriptreact = {extends = 'jsx'},
    typescript = {extends = 'jsx'},
    typescriptreact = {extends = 'jsx'},
  }

  -- Etc
  use 'direnv/direnv.vim'
  use 'editorconfig/editorconfig-vim'
  use 'jamestthompson3/nvim-remote-containers'
  use {"akinsho/toggleterm.nvim", config = function() require('toggleterm').setup({
      start_in_insert = false
  }) end}
  use {"folke/persistence.nvim", config = function() require('persistence').setup() end}
  vim.g.direnv_auto = 1
end)


vim.o.background = 'dark'
vim.cmd [[colo catppuccin]]
vim.cmd [[filetype plugin indent on]]
vim.cmd [[syntax enable]]

-- Bindings
local map = vim.keymap.set

map('n', 'gd', vim.lsp.buf.definition)
map('n', 'K', vim.lsp.buf.hover)
map('n', 'gr', vim.lsp.buf.references)
map('n', '<localleader>f', vim.lsp.buf.formatting)
map('n', '<localleader>r', vim.lsp.buf.rename)
map('n', '<localleader>a', vim.lsp.buf.code_action)
map('n', '<localleader>e', vim.diagnostic.open_float)

map('n', '<leader>/', ':Telescope live_grep <CR>')
map('n', '<leader>;', ':Telescope commands<CR>')
map('n', '<leader><CR>', ':')
map('n', '<leader><leader>', ':b#<CR>')
map('n', '<leader>a', ':ToggleTerm<CR>')
map('n', '<leader>b', ':Telescope buffers<CR>')
map('n', '<leader>c', ':Telescope treesitter<CR>')
map('n', '<leader>d', ':NvimTreeToggle<CR>')
map('n', '<leader>e', ':e <C-R>=expand("%:p:h") . "/" <CR>')
map('n', '<leader>f', ':Telescope git_files<CR>')
map('n', '<leader>g', ':Git<CR>')
map('n', '<leader>h', ':Telescope help_tags<CR>')
map('n', '<leader>i', ':echom "UNUSED"<CR>')
map('n', '<leader>jd', ':e ~/Dropbox/notes/dashboard.md<CR>')
map('n', '<leader>jj', ':Telescope find_files search_dirs={"~/Dropbox/notes"}<CR>')
map('n', '<leader>js', ':e /tmp/scratch.md<CR>')
map('n', '<leader>jt', ':e ~/notes/todo.txt<CR>')
map('n', '<leader>k', ':q<CR>')
map('n', '<leader>ln', vim.diagnostic.goto_next)
map('n', '<leader>ll', vim.diagnostic.open_float)
map('n', '<leader>lp', vim.diagnostic.goto_prev)
map('n', '<leader>m', ':Telescope oldfiles<CR>')
map('n', '<leader>n', ':tabe<CR>')
-- map('n', '<leader>oo', ':e ~/Dropbox/org/refile.org')
map('n', '<leader>p', ':cw<CR>')
map('n', '<leader>q', ':qa<CR>')
map('n', '<leader>ra', ':%s/')
map('n', '<leader>rr', ':s/')
map('n', '<leader>sh', ':vsplit<CR>')
map('n', '<leader>sj', ':split<CR><C-W>j')
map('n', '<leader>sk', ':split<CR>')
map('n', '<leader>sl', ':vsplit<CR><C-W>l')
map('n', '<leader>tt', ':UltestNearest<CR>')
map('n', '<leader>to', ':UltestOutput<CR>')
map('n', '<leader>ts', ':UltestSummary!<CR>')
map('n', '<leader>u', ':echom "UNUSED"<CR>')
map('n', '<leader>va', ':e ~/dotfiles/.bash_aliases<CR>')
map('n', '<leader>vk', ':e ~/.config/kitty/kitty.conf<CR>')
map('n', '<leader>vl', ':e .nvim/init.lua<CR>')
map('n', '<leader>vv', ':e ~/.config/nvim/init.lua<CR>')
map('n', '<leader>vt', ':e ~/dotfiles/.tmux.conf<CR>')
map('n', '<leader>vu', ':e ~/dotfiles/init.lua<CR>')
map('n', '<leader>vz', ':e ~/dotfiles/.zshrc<CR>')
map('n', '<leader>w', ':w<CR>')
map('n', '<leader>x', 'mzgggqG`z')
-- map('n', '<leader>y', ':LuaSnipEdit<CR>')
map('n', '<leader>z', function() 
  if vim.o.foldlevel > 0 then
    vim.o.foldlevel = 0
  else
    vim.o.foldlevel = 99
  end 
end)

-- Window navigation
map('n', '<C-j>', '<C-W>j')
map('n', '<C-k>', '<C-W>k')
map('n', '<C-h>', '<C-W>h')
map('n', '<C-l>', '<C-W>l')

-- Arrows resize
map('n', '<Left>', ':vertical res -5<CR>')
map('n', '<Right>', ':vertical res +5<CR>')
map('n', '<Up>', ':res +5<CR>')
map('n', '<Down>', ':res -5<CR>')

-- Etc. keymappings
map('n', '-', ':NvimTreeFindFile<CR>')
map('n', 'Q', '@q')
map('n', '/', '/\\v')
map('n', '?', '?\\v')
map('n', 'H', 'gT')
map('n', 'L', 'gt')
map('n', '!', ':!')
map('n', 'q:', ':q')
map('n', 'Z',  'zA')
map('i', '<C-c>', '<ESC>')
map('i', 'jj', '<ESC>')
map('n', '<BS>', ':b#<CR>')

-- Terminal stuff
map('t', '<Esc>', '<C-\\><C-n>')
map('t', '<C-h>', '<C-\\><C-n><C-w>h')
map('t', '<C-j>', '<C-\\><C-n><C-w>j')
map('t', '<C-k>', '<C-\\><C-n><C-w>k')
map('t', '<C-l>', '<C-\\><C-n><C-w>l')
vim.cmd  [[au TermOpen * setlocal nonumber norelativenumber bufhidden=hide]]

vim.cmd [[ au! bufwritepost init.lua source % ]]
if vim.fn.filereadable("./.nvim/init.lua") == 1 then
  dofile("./.nvim/init.lua")
end

require("which-key").setup{}

