-- window
vim.o.termguicolors = true
vim.o.ignorecase = true
vim.wo.number = true
vim.wo.relativenumber = true

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
vim.o.colorcolumn = "+" .. vim.fn.join(vim.fn.range(1, 254), ',+')

-- Update the loclist with diagnostics automatically
vim.api.nvim_create_autocmd("DiagnosticChanged", {
  callback = function()
    vim.diagnostic.setloclist({ open = false })
  end
})
