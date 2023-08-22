local map = vim.keymap.set

vim.g.mapleader = " "

map("n", "<leader>wh", "<C-w>h")
map("n", "<leader>wj", "<C-w>j")
map("n", "<leader>wk", "<C-w>k")
map("n", "<leader>wl", "<C-w>l")

-- Allows yanking to the clipboard
map("v", "<leader>y", [["*y]])

-- Command to exit insert mode in terminal
map("t", "<esc>", "<C-\\><C-n>")

-- Searching
map("n", "<leader>p", function() vim.cmd("Telescope find_files") end)
map("n", "<leader>f", function() vim.cmd("Telescope live_grep") end)
map("n", "<leader>tb", function() vim.cmd("Telescope buffers") end)
map("n", "<leader>tk", function() vim.cmd("Telescope commands") end)
map("n", "<leader>tm", function() vim.cmd("Telescope marks") end)
map("n", "<leader>ts", function() vim.cmd("Telescope lsp_document_symbols") end)

-- Easy motion
map("n", "<leader>s", "<Plug>(easymotion-s)")

-- Language server keybinds, nvim-cmp specific ones are set in lsp
local bufopts = { noremap = true, silent = true }
map("n", "K", vim.lsp.buf.hover, bufopts)
map("n", "gd", function() require('telescope.builtin').lsp_definitions() end, bufopts)
map("n", "<leader>cr", vim.lsp.buf.rename)
map("n", "<leader>ca", vim.lsp.buf.code_action)
map("n", "<leader>cq", function() vim.diagnostic.setloclist() end, bufopts)

-- Debugging
map("n", "<F1>", function() require("dap").continue() end, bufopts)
map("n", "<F2>", function() require("dap").step_over() end, bufopts)
map("n", "<F3>", function() require("dap").step_into() end, bufopts)
map("n", "<F4>", function() require("dap").step_out() end, bufopts)
map("n", "<leader>dt", function() require("dap").toggle_breakpoint() end, bufopts)
map("n", "<leader>db", "<cmd>Telescope dap list_breakpoints <cr>", bufopts)
map("n", "<leader>du", function() require('dapui').toggle() end, bufopts)

-- Calling it twice means we auto jump into the eval window
map("n", "<leader>di", function()
  require("dapui").eval(nil, { enter = true });
end, bufopts)

-- Trouble
map("n", "<leader>x", function() vim.cmd("TroubleToggle") end)
