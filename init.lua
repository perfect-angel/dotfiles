-----------------------------------------------------------
-- ANGEL CAMPBELL'S WONDERFUL HORRIBLE VIM CONFIG
-- note: this is not a good endorsement
--       of me as a serious person
------------------------------------------------------------

-- Settings {{{
vim.o.clipboard = "unnamedplus"
vim.o.expandtab = true
vim.o.foldmethod = "expr"
vim.o.grepprg = "rg --vimgrep --no-heading --smart-case"
vim.o.shiftwidth = 2

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
vim.g.netrw_banner = 0
-- }}}

-- LSP {{{
vim.lsp.config('ember', {
  cmd = {'ember-language-server', '--stdio'},
  filetypes = { "handlebars", "typescript", "javascript", "typescript.glimmer", "javascript.glimmer" },
  root_markers = {'ember-cli-build.js', '.git'}
})
vim.lsp.enable('ember')
-- }}}

------------------------------------------------------------
-- > YOU ARE LOVED
-- > YOU ARE WORTHY OF THAT LOVE
-- > YOU ARE NOT IN TROUBLE
-- > DRINK WATER
------------------------------------------------------------
-- vim:foldmethod=marker
