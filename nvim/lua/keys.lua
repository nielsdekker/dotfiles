local map = vim.keymap.set

vim.g.mapleader = " "

map("n", "<leader>wh", "<C-w>h")
map("n", "<leader>wj", "<C-w>j")
map("n", "<leader>wk", "<C-w>k")
map("n", "<leader>wl", "<C-w>l")

map("n", "-", function()
  require("nvim-tree.api").tree.open({
    path = vim.fn.getcwd(),
    find_file = true
  })
end)

-- Command to exit insert mode in terminal
map("t", "<leader><Esc>", "<C-\\><C-n>")

-- Searching
map("n", "<leader>p", function() vim.cmd("Telescope find_files") end)
map("n", "<leader>f", function() vim.cmd("Telescope live_grep") end)
map("n", "<leader>b", function() vim.cmd("Telescope buffers") end)
map("n", "<leader>k", function() vim.cmd("Telescope commands") end)
map("n", "<leader>m", function() vim.cmd("Telescope marks") end)

-- Easy motion
map("n", "<leader>s", "<Plug>(easymotion-s)")

-- Terminal
map("n", "<leader>t", function() vim.cmd("ToggleTerm direction=float") end)
map("t", "<esc>", "<C-\\><C-n>")

-- Language server keybinds, nvim-cmp specific ones are set in lsp
local bufopts = { noremap = true, silent = true }
map("n", "K", vim.lsp.buf.hover, bufopts)
map("n", "gr", function() require('telescope.builtin').lsp_references() end, bufopts)
map("n", "gd", function() require('telescope.builtin').lsp_definitions() end, bufopts)
map("n", "<leader>cr", vim.lsp.buf.rename)
map("n", "<leader>ca", vim.lsp.buf.code_action)

-- Debugging
map("n", "<F5>", function() require("dap").continue() end, bufopts)
map("n", "<F10>", function() require("dap").step_over() end, bufopts)
map("n", "<F11>", function() require("dap").step_into() end, bufopts)
map("n", "<F12>", function() require("dap").step_out() end, bufopts)
map("n", "<leader>dt", function() require("dap").toggle_breakpoint() end, bufopts)
map("n", "<leader>db", "<cmd>Telescope dap list_breakpoints <cr>", bufopts)
map("n", "<leader>du", function() require('dapui').toggle() end, bufopts)

-- Calling it twice means we auto jump into the eval window
map("n", "<leader>di", function()
  require("dapui").eval(nil, { enter = true });
end, bufopts)

-- Trouble
map("n", "<leader>x", function() vim.cmd("TroubleToggle") end)
