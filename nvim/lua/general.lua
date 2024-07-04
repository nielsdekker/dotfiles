-- window
vim.o.background = "dark"
vim.o.termguicolors = true
vim.o.ignorecase = true
vim.wo.number = false
vim.wo.relativenumber = false
vim.o.cmdheight = 0
vim.opt.laststatus = 3

-- Tabs and spaces
vim.wo.wrap = false
vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.expandtab = true
vim.o.smarttab = true
vim.o.list = true

vim.o.signcolumn = "yes"

vim.g.shell = "/bin/zsh"
vim.o.shell = "/bin/zsh"
vim.o.exrc = true
vim.o.cursorline = true

-- Enable spell checking
vim.o.spell = true
vim.o.spelllang = "en,nl"

-- Autocommands

-- Some default configuration about how the LSP should handle diagnostics.
-- In short this disables the inline virtual text and adds a float when
-- hovering over an error instead.
vim.diagnostic.config({
  virtual_text = false
})
vim.o.updatetime = 250
vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
  group = vim.api.nvim_create_augroup("float_diagnostic", { clear = true }),
  callback = function()
    vim.diagnostic.open_float(nil, { focus = false })
  end
})
