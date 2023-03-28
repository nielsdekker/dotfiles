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

map("t", "<leader><Esc>", "<C-\\><C-n>", options)

-- File searching
map("n", "<leader>p", "<cmd>Telescope find_files <cr>", options)
map("n", "<leader>f", "<cmd>Telescope live_grep <cr>", options)
map("n", "<leader>b", "<cmd>Telescope buffers <cr>", options)
map("n", "<leader>k", "<cmd>Telescope commands <cr>", options)
map("n", "<leader>m", "<cmd>Telescope marks <cr>", options)

-- Easy motion
map("n", "<leader>s", "<Plug>(easymotion-s)", options)

-- Language server keybinds, nvim-cmp specific ones are set in lsp
local bufopts = { noremap = true, silent = true, buffer = bufnr }
map("n", "gr", "<cmd>lua require('telescope.builtin').lsp_references() <cr>", bufopts)
map("n", "gd", "<cmd>lua require('telescope.builtin').lsp_definitions() <cr>", bufopts)

vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)

-- Debugging
map("n", "<F5>", "<cmd>lua require('dap').continue() <cr>", bufopts)
map("n", "<F10>", "<cmd>lua require('dap').step_over() <cr>", bufopts)
map("n", "<F11>", "<cmd>lua require('dap').step_into() <cr>", bufopts)
map("n", "<F12>", "<cmd>lua require('dap').step_out() <cr>", bufopts)
map("n", "<leader>db", "<cmd>lua require('dap').toggle_breakpoint() <cr>", bufopts)
map("n", "<leader>dlb", "<cmd>Telescope dap list_breakpoints <cr>", bufopts)
map("n", "<leader>dt", "<cmd>lua require('dapui').toggle() <cr>", bufopts)

-- Trouble
map("n", "<leader>x", "<cmd>TroubleToggle<cr>", options)

-- "copilot"
map("i", "<Right>", "copilot#Accept('<CR>')", { silent = true, expr = true })
