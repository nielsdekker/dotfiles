-- window
vim.o.termguicolors = true
vim.o.ignorecase = true
vim.o.number = true
vim.o.relativenumber = true
vim.o.cmdheight = 0
vim.o.laststatus = 3
vim.o.textwidth = 80
vim.o.colorcolumn = "+1"
vim.o.signcolumn = "yes"
vim.o.winborder = "solid"
vim.o.winblend = 7

-- Tabs and spaces
vim.o.wrap = false
vim.o.tabstop = 4
vim.o.shiftwidth = 0
vim.o.expandtab = true
vim.o.smarttab = true
vim.o.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '+' }

vim.g.shell = "/bin/zsh"
vim.o.shell = "/bin/zsh"
vim.o.exrc = true
vim.o.cursorline = true

-- Enable spell checking
vim.o.spell = true
vim.o.spelllang = "en,nl"
vim.o.spelloptions = "camel,noplainbuffer"

-- Make sure terraform files work as intended
vim.filetype.add({
    extension = {
        tf = "terraform"
    }
})

-- Some default configuration about how the LSP should handle diagnostics.
-- In short this disables the inline virtual text and adds a float when
-- hovering over an error instead.
vim.o.updatetime = 250
vim.diagnostic.config({
    virtual_text = false,
    virtual_lines = true,
})
