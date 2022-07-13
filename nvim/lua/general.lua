-- window
vim.wo.number = true
vim.wo.relativenumber = true
vim.o.ignorecase = true

-- Tabs and spaces
vim.wo.wrap = false
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.softtabstop = 4
vim.o.expandtab = true

-- Theming
vim.o.background = "light"
-- vim.g.tokyonight_style = "night"
-- vim.g.tokyonight_italic_functions = true
-- vim.g.tokyonight_italic_comments = true
vim.g.ayucolor="light"
vim.cmd[[colorscheme ayu]]

vim.api.nvim_command('let &colorcolumn=join(range(80,999), ",")')

