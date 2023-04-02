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
vim.cmd("colorscheme kanagawa")

-- Custom font changes
local currentCommentHL = vim.api.nvim_get_hl_by_name("Comment", true)
vim.api.nvim_set_hl(0, "Comment", { italic = true, fg = currentCommentHL.foreground })
vim.api.nvim_set_hl(0, "Normal", { bg = "NONE" })

-- Ale settings
vim.g.ale_linters_explicit = 1
vim.g.ale_fix_on_save = 1
vim.g.ale_fixers = {
  javascript = { 'prettier' },
  javascriptreact = { 'prettier' },
  typescript = { 'prettier' },
  typescriptreact = { 'prettier' },
  json = { 'prettier' },
  css = { 'prettier' },
  svg = { 'prettier' }
}
vim.o.signcolumn = "yes"

vim.g.shell = "/bin/zsh"
vim.o.shell = "/bin/zsh"

vim.o.exrc = true
