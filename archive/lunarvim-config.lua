-- ANGEL CAMPBELL'S WONDERFUL HORRIBLE VIM CONFIG

-- > YOU ARE LOVED AND WORTHY OF LOVE
-- > YOU ARE NOT IN TROUBLE
-- > NOBODY IS GOING TO GET YOU
-- > DRINK WATER

-- settings
lvim.log.level = "warn"
lvim.format_on_save = true
vim.g.maplocalleader = ','
vim.g.qf_join_changes = true
vim.g.netrw_keepdir = 0
vim.o.guifont = "mononoki Nerd Font Mono:h22"
vim.o.hlsearch = false
vim.o.grepprg = "rg --vimgrep --no-heading --smart-case"
vim.o.autochdir = false
vim.o.clipboard = "unnamedplus"
vim.o.relativenumber = true
vim.o.foldlevel = 99
vim.o.foldmethod = "expr"
vim.o.foldexpr = "nvim_treesitter#foldexpr()"
vim.g["test#strategy"] = "neovim"
lvim.leader = "space"
lvim.localleader = ","
lvim.colorscheme = "habamax"

-- keymappings
lvim.keys.normal_mode["gd"] = vim.lsp.buf.definition
lvim.keys.normal_mode['K'] = vim.lsp.buf.hover
lvim.keys.normal_mode['gr'] = vim.lsp.buf.references
lvim.keys.normal_mode['<C-x>'] = ":ToggleTerm size=12<CR>"
lvim.keys.normal_mode['<localleader>f'] = vim.lsp.buf.format
lvim.keys.normal_mode['<localleader>r'] = vim.lsp.buf.rename
lvim.keys.normal_mode['<localleader>a'] = vim.lsp.buf.code_action
lvim.keys.visual_mode['<localleader>a'] = vim.lsp.buf.code_action

lvim.keys.normal_mode['<C-j>'] = '<C-W>j'
lvim.keys.normal_mode['<C-k>'] = '<C-W>k'
lvim.keys.normal_mode['<C-h>'] = '<C-W>h'
lvim.keys.normal_mode['<C-l>'] = '<C-W>l'

-- Arrows resize
lvim.keys.normal_mode['<Left>'] = ':vertical res -5<CR>'
lvim.keys.normal_mode['<Right>'] = ':vertical res +5<CR>'
lvim.keys.normal_mode['<Up>'] = ':res +5<CR>'
lvim.keys.normal_mode['<Down>'] = ':res -5<CR>'

lvim.keys.normal_mode['-'] = ':25Lex %:h<CR><CR>'
lvim.keys.normal_mode['Q'] = '@q'
lvim.keys.normal_mode['/'] = '/\\v'
lvim.keys.normal_mode['?'] = '?\\v'
lvim.keys.normal_mode['H'] = 'gT'
lvim.keys.normal_mode['L'] = 'gt'
lvim.keys.normal_mode['!'] = ':!<C-n>'
lvim.keys.normal_mode['q:'] = ':q'
lvim.keys.normal_mode['Z'] = 'zA'
lvim.keys.normal_mode['<BS>'] = ':b#<CR>'
lvim.keys.normal_mode['<Left>'] = ':vertical res -5<CR>'
lvim.keys.normal_mode['<Right>'] = ':vertical res +5<CR>'
lvim.keys.normal_mode['<Up>'] = ':res +5<CR>'
lvim.keys.normal_mode['<Down>'] = ':res -5<CR>'

lvim.keys.insert_mode['jj'] = '<ESC>'

vim.keymap.set('t', '<Esc>', '<C-\\><C-n>')
vim.keymap.set('t', '<C-h>', '<C-\\><C-n><C-w>h')
vim.keymap.set('t', '<C-j>', '<C-\\><C-n><C-w>j')
vim.keymap.set('t', '<C-k>', '<C-\\><C-n><C-w>k')
vim.keymap.set('t', '<C-l>', '<C-\\><C-n><C-w>l')
vim.keymap.set('t', '<C-x>', '<C-\\><C-n>:ToggleTerm size=12<CR>')
vim.cmd [[au TermOpen * setlocal nonumber norelativenumber bufhidden=hide]]

-- Leader mappings
lvim.keys.normal_mode['<leader>/'] = ':<cmd>Telescope live_grep<CR>'
lvim.keys.normal_mode['<leader>;'] = ':Telescope commands<CR>'
lvim.keys.normal_mode['<leader><CR>'] = ':'
lvim.keys.normal_mode['<leader><leader>'] = ':'
lvim.keys.normal_mode['<leader>a'] = ':ToggleTerm size=12<CR>'
lvim.keys.normal_mode['<leader>b'] = ':Telescope buffers<CR>'
lvim.keys.normal_mode['<leader>c'] = ':Telescope treesitter<CR>'
lvim.keys.normal_mode['<leader>d'] = ':25Lex<CR>'
lvim.keys.normal_mode['<leader>e'] = ':e <C-R>=expand("%:p:h")<CR>/<C-n>'
lvim.keys.normal_mode['<leader>f'] = ':Telescope git_files<CR>'
lvim.keys.normal_mode['<leader>gd'] = ':Git diff dev...HEAD %<CR>'
lvim.keys.normal_mode['<leader>gg'] = ':Git<CR>'
lvim.keys.normal_mode['<leader>h'] = ':Telescope help_tags<CR>'
-- lvim.keys.normal_mode['<leader>i'] = 'echom unused'
lvim.keys.normal_mode['<leader>jf'] = ':Telescope find_files search_dirs={"~/Dropbox/notes"}<CR>'
lvim.keys.normal_mode['<leader>jj'] = ':e ~/notes/journal.md<CR>'
lvim.keys.normal_mode['<leader>jr'] = ':e ~/notes/read-watch-listen.md<CR>'
lvim.keys.normal_mode['<leader>js'] = ':e ~/notes/shopping.md<CR>'
lvim.keys.normal_mode['<leader>jt'] = ':e ~/notes/todo.md<CR>'
lvim.keys.normal_mode['<leader>jr'] = ':e ~/notes/read-watch-listen.md<CR>'
lvim.keys.normal_mode['<leader>k'] = ':q<CR>'
lvim.keys.normal_mode['<leader>ll'] = vim.diagnostic.setqflist
lvim.keys.normal_mode['<leader>ln'] = vim.diagnostic.goto_next
lvim.keys.normal_mode['<leader>lp'] = vim.diagnostic.goto_prev
lvim.keys.normal_mode['<leader>m'] = ':Telescope oldfiles<CR>'
lvim.keys.normal_mode['<leader>n'] = ':tabe<CR>'
lvim.keys.normal_mode['<leader>o'] = ':Telescope current_buffer_fuzzy_find<CR>'
lvim.keys.normal_mode['<leader>p'] = ':cw<CR>'
lvim.keys.normal_mode['<leader>q'] = ':qa<CR>'
lvim.keys.normal_mode['<leader>r'] = ':%s/'
lvim.keys.normal_mode['<leader>sh'] = ':vsplit<CR><C-w>h'
lvim.keys.normal_mode['<leader>sj'] = ':split<CR>'
lvim.keys.normal_mode['<leader>sk'] = ':split<CR><C-w>k'
lvim.keys.normal_mode['<leader>sl'] = ':vsplit<CR>'
lvim.keys.normal_mode['<leader>tt'] = ':TestNearest<CR>'
lvim.keys.normal_mode['<leader>tf'] = ':TestFile<CR>'
lvim.keys.normal_mode['<leader>ti'] = ':TestVisit<CR>'
lvim.keys.normal_mode['<leader>va'] = ':e ~/dotfiles/.bash_aliases<CR>'
lvim.keys.normal_mode['<leader>vd'] = ':e ~/local-init.lua<CR>'
lvim.keys.normal_mode['<leader>vk'] = ':e ~/.config/kitty/kitty.conf<CR>'
lvim.keys.normal_mode['<leader>vl'] = ':e .nvim/init.lua<CR>'
lvim.keys.normal_mode['<leader>vv'] = ':e ~/.config/lvim/config.lua<CR>'
lvim.keys.normal_mode['<leader>vs'] = ':e ~/dotfiles/.zshrc<CR>'
lvim.keys.normal_mode['<leader>vt'] = ':e ~/dotfiles/.tmux.conf<CR>'
lvim.keys.normal_mode['<leader>w'] = ':w<CR>'
lvim.keys.normal_mode['<leader>x'] = ':Telescope find_files search_dirs={"~/dotfiles/snippets"}<CR>'
lvim.keys.normal_mode['<leader>y'] = ':let @+ = expand("%")<cr>'
lvim.keys.normal_mode['<leader>z'] = function() if vim.wo.foldlevel > 0 then vim.wo.foldlevel = 0 else vim.wo.foldlevel = 99 end end

vim.cmd [[au TermOpen * setlocal nonumber norelativenumber bufhidden=hide]]
vim.cmd [[au FileType typescript,typescriptreact setlocal foldmethod=indent]]
vim.cmd [[au FileType toggleterm setlocal modifiable]]
vim.cmd [[au BufEnter journal.md nn <C-n> <C-x>k ]]
vim.cmd [[au BufEnter journal.md lua require('cmp').setup.buffer { enabled = false } ]]

-- suprress builtins
lvim.builtin.which_key.active = false
lvim.builtin.alpha.active = false
lvim.builtin.lir.active = false
lvim.builtin.dap.active = true
lvim.builtin.bufferline.active = false
lvim.builtin.terminal.direction = 'horizontal'
lvim.builtin.nvimtree.active = false
lvim.builtin.luasnip.sources.friendly_snippets = false
lvim.builtin.treesitter.highlight.enabled = true
lvim.builtin.project.manual_mode = true

-- treesitter
lvim.builtin.treesitter.ensure_installed = {
  "bash",
  "javascript",
  "json",
  "lua",
  "python",
  "typescript",
  "tsx",
  "css",
  "rust",
  "yaml",
  "dockerfile",
}

-- LSP
require("lvim.lsp.manager").setup("eslint")

-- formatters
local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
  { command = "prettier", filetypes = { "typescript", "typescriptreact", "javascript", "javascriptreact", "json" } },
}

-- -- linters
-- local linters = require "lvim.lsp.null-ls.linters"
-- linters.setup {
--   { command = "flake8", filetypes = { "python" } },
-- }

-- Additional Plugins
vim.cmd [[packadd cfilter]]
lvim.plugins = {
  { 'tpope/vim-fugitive' },
  { 'tpope/vim-abolish' },
  { 'tpope/vim-surround' },
  { 'tpope/vim-repeat' },
  { 'tpope/vim-vinegar' },
  { 'hashivim/vim-terraform' },
  { 'tpope/vim-dadbod' },
  { 'kristijanhusak/vim-dadbod-ui' },
  { 'kristijanhusak/vim-dadbod-completion' },
  { 'mattn/emmet-vim' },
  { 'stefandtw/quickfix-reflector.vim' },
  { 'justinmk/vim-sneak' },
  { 'vim-test/vim-test' },
  { 'ray-x/lsp_signature.nvim' },
  { "ellisonleao/gruvbox.nvim" },
  { "entrez/roku.vim" }
}

--- plugin config
vim.g.user_emmet_settings = {
  javascript = { extends = 'jsx' },
  javascriptreact = { extends = 'jsx' },
  typescriptreact = { extends = 'jsx' },
}

require("lsp_signature").setup({})

require("luasnip.loaders.from_snipmate").lazy_load({ paths = "~/dotfiles/snippets" })

vim.g["sneak#label"] = true
vim.g["sneak#use_ic_ics"] = true

-- project config
if vim.fn.filereadable("./.nvim/init.lua") == 1 then
  dofile("./.nvim/init.lua")
end
-- device config
if vim.fn.filereadable(os.getenv("HOME") .. "local-init.lua") == 1 then
  dofile(os.getenv("HOME") .. "local-init.lua")
end
