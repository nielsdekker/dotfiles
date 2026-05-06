-- window
vim.opt.termguicolors = true
vim.opt.ignorecase = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cmdheight = 1
vim.opt.laststatus = 3
vim.opt.textwidth = 80
vim.opt.signcolumn = "yes"
vim.opt.winborder = "solid"
vim.opt.fillchars = "eob: "
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8
vim.opt.mousescroll = "ver:1,hor:1"
vim.opt.updatetime = 1000
vim.opt.swapfile = false
vim.opt.switchbuf = ""

-- Tabs and spaces
vim.opt.wrap = false
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smarttab = true
vim.opt.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "+" }

vim.opt.shell = "/bin/zsh"
vim.opt.cursorline = true

-- Autocompletion
vim.opt.autocomplete = true
vim.opt.complete = "o,.^5"
vim.opt.completeopt = "fuzzy,menuone,noselect,popup"
vim.opt.pumheight = 8

-- Enable spell checking
vim.opt.spell = true
vim.opt.spelllang = "en,nl"
vim.opt.spelloptions = "camel,noplainbuffer"

-- Make sure terraform files work as intended
vim.filetype.add({
    extension = {
        tf = "terraform",
    },
})

-- Enable the new UI
require("vim._core.ui2").enable({
    enable = true,
})
