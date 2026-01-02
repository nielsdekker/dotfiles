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
-- vim.o.winblend = 7
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

vim.g.shell = "/bin/zsh"
vim.o.shell = "/bin/zsh"
vim.o.exrc = true
vim.o.cursorline = true

-- Enable spell checking
vim.o.spell = true
vim.o.spelllang = "en,nl"
vim.o.spelloptions = "camel,noplainbuffer"

vim.cmd.colorscheme("nelis")

-- Make sure terraform files work as intended
vim.filetype.add({
	extension = {
		tf = "terraform",
	},
})

-- Diagnostics
vim.diagnostic.config({
	virtual_text = true,
	virtual_lines = false,

	signs = {
		linehl = {
			[vim.diagnostic.severity.ERROR] = "DiagnosticErrorLine",
			[vim.diagnostic.severity.WARN] = "DiagnosticWarnLine",
			[vim.diagnostic.severity.HINT] = "DiagnosticHintLine",
			[vim.diagnostic.severity.INFO] = "DiagnosticHintLine",
		},
	},
})

vim.api.nvim_create_autocmd("CursorHold", {
	pattern = "*",
	callback = function()
		vim.diagnostic.open_float()
	end,
})
