local map = vim.keymap.set

vim.g.mapleader = " "

---------------------
-- Vim standard stuff
---------------------

-- Navigation
map("n", "<leader>wh", "<C-w>h")
map("n", "<leader>wj", "<C-w>j")
map("n", "<leader>wk", "<C-w>k")
map("n", "<leader>wl", "<C-w>l")
map("v", "<leader>y", "\"+y") -- Yanks to the clipboard

-- Goto
map("n", "g]", function() vim.cmd("cnext") end)
map("n", "g[", function() vim.cmd("cprev") end)
map("n", "gd", function() require("mini.extra").pickers.lsp({ scope = "definition" }) end, { silent = true })
map("n", "gr", function() require("mini.extra").pickers.lsp({ scope = "references" }) end, { silent = true })

-- Diagnostics
map("n", "K", vim.lsp.buf.hover, { silent = true })

----------
-- Plugins
----------

-- Mini pick
map("n", "<leader>p", function() require("mini.pick").builtin.files({ tool = "git" }) end)
map("n", "<leader>f", function() require("mini.pick").builtin.grep_live({ tool = "git" }) end)
map("n", "<leader>b", function() require("mini.pick").builtin.buffers() end)
map("n", "<leader>m", function() require("mini.extra").pickers.marks() end)
map("n", "<leader>k", function() require("mini.extra").pickers.commands() end)
map("n", "-", function() require("mini.files").open(vim.api.nvim_buf_get_name(0), false) end)

-- Mini completion
map("i", "<Tab>", function()
    return vim.fn.pumvisible() == 1 and "<C-n>" or "<Tab>"
  end,
  { silent = true, expr = true }
)
map("i", "<S-Tab>", function()
    return vim.fn.pumvisible() == 1 and "<C-p>" or "<S-Tab>"
  end,
  { silent = true, expr = true }
)

-- Code actions
map("n", "<leader>cs", function() require("mini.extra").pickers.lsp({ scope = "document_symbol" }) end, { silent = true })
map("n", "<leader>cd", function() require("trouble").toggle("document_diagnostics") end, { silent = true })
map("n", "<leader>cr", vim.lsp.buf.rename)
map("n", "<leader>ca", vim.lsp.buf.code_action)

-- Debugging
map("n", "<F1>", function() require("dap").continue() end, { silent = true })
map("n", "<F2>", function() require("dap").step_over() end, { silent = true })
map("n", "<F3>", function() require("dap").step_into() end, { silent = true })
map("n", "<F4>", function() require("dap").step_out() end, { silent = true })
map("n", "<leader>dt", function() require("dap").toggle_breakpoint() end, { silent = true })
map("n", "<leader>db", "<cmd>Telescope dap list_breakpoints <cr>", { silent = true })
map("n", "<leader>du", function() require('dapui').toggle() end, { silent = true })
