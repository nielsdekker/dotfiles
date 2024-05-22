-- window
vim.o.background = "dark"
vim.o.termguicolors = true
vim.o.ignorecase = true
vim.wo.number = false
vim.wo.relativenumber = false
vim.o.cmdheight = 0

-- Tabs and spaces
vim.wo.wrap = false
vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.expandtab = true
vim.o.smarttab = true

vim.o.signcolumn = "yes"

vim.g.shell = "/bin/zsh"
vim.o.shell = "/bin/zsh"
vim.o.exrc = true
vim.o.cursorline = true

-- Color column
vim.o.textwidth = 80

-- Enable spell checking
vim.o.spell = true
vim.o.spelllang = "en,nl"

if vim.lsp.inlay_hint ~= nil then
  vim.lsp.inlay_hint.enable()
end
