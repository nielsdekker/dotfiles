-- window
vim.wo.number = true
vim.wo.relativenumber = true
vim.o.ignorecase = true

-- Tabs and spaces
vim.wo.wrap = false
vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.softtabstop = 2
vim.o.expandtab = true

-- Theming
vim.o.background = "dark"
vim.g.tokyonight_style = "night"
vim.g.tokyonight_italic_functions = true
vim.g.tokyonight_italic_comments = true
vim.cmd("colorscheme nightfox")
vim.api.nvim_command('let &colorcolumn=join(range(80,999), ",")')

-- Ale settings
vim.g.ale_linters_explicit = 1
vim.g.ale_fix_on_save = 1
vim.g.ale_fixers = {
  javascript = { 'prettier' },
  javascriptreact = { 'prettier' },
  typescript = { 'prettier' },
  typescriptreact = { 'prettier' },
  css = { 'prettier' }
}

vim.g.shell="/bin/zsh"
vim.o.shell="/bin/zsh"

