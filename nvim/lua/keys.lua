local map = vim.api.nvim_set_keymap

-- Default options
local options = { noremap = true }

vim.g.mapleader = " "

-- Window navigation
map("n", "<leader>tt", ":tabnew<CR>", options)
map("n", "<leader>th", ":tabprevious<CR>", options)
map("n", "<leader>tl", ":tabnext<CR>", options)

map("n", "<leader>wh", "<C-w>h", options)
map("n", "<leader>wj", "<C-w>j", options)
map("n", "<leader>wk", "<C-w>k", options)
map("n", "<leader>wl", "<C-w>l", options)

-- File searching
map("n", "<leader>p", ":FZF<CR>", options)
map("n", "<leader>f", ":Ag<CR>", options)

-- Easy motion
map("n", "<leader>s", "<Plug>(easymotion-s)", options)
map("n", "<leader>j", "<Plug>(easymotion-j)", options)
map("n", "<leader>k", "<Plug>(easymotion-k)", options)

-- Language server keybinds, nvim-cmp specific ones are set in lsp
local bufopts = { noremap = true, silent = true, buffer = bufnr }
vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)

-- Trouble
map("n", "<leader>x", "<cmd>TroubleToggle<cr>", options)
