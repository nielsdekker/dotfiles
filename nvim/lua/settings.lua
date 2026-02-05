-- window
vim.o.termguicolors = true
vim.o.ignorecase = true
vim.o.number = true
vim.o.relativenumber = true
vim.o.cmdheight = 0
vim.o.laststatus = 3
vim.o.textwidth = 80
vim.o.signcolumn = "yes"
vim.o.winborder = "solid"
vim.o.fillchars = "eob: "
vim.o.scrolloff = 8
vim.o.sidescrolloff = 8
vim.o.mousescroll = "ver:1,hor:1"
vim.o.updatetime = 1000
vim.o.swapfile = false

-- Tabs and spaces
vim.o.wrap = false
vim.o.tabstop = 4
vim.o.shiftwidth = 0
vim.o.expandtab = true
vim.o.smarttab = true
vim.o.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "+" }

vim.o.shell = "/bin/zsh"
vim.o.exrc = true
vim.o.cursorline = true

-- Autocompletion
vim.o.complete = "."
vim.o.completeopt = "fuzzy,menuone,noselect,popup"
vim.o.pumheight = 8

-- Enable spell checking
vim.o.spell = true
vim.o.spelllang = "en,nl"
vim.o.spelloptions = "camel,noplainbuffer"

-- Make sure terraform files work as intended
vim.filetype.add({
	extension = {
		tf = "terraform",
	},
})
