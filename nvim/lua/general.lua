-- window
vim.wo.number = true
vim.wo.relativenumber = true
vim.o.ignorecase = true

-- Tabs and spaces
vim.wo.wrap = false
vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.expandtab = true
vim.o.smarttab = true

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

-- Overrides for specific filetypes
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "kotlin", "java" },
  callback = function()
    vim.bo.shiftwidth = 4
    vim.bo.tabstop = 4
  end
})

-- Auto hover diagnostics
vim.o.updatetime = 100
vim.api.nvim_create_autocmd("CursorHold", {
  callback = function()
    vim.diagnostic.open_float(nil, { focus = false })
  end
})
