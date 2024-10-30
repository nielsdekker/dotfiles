local map = vim.keymap.set

vim.g.mapleader = " "

-- Some guidelines about the keybindings:
-- - Most keybindings are in the format: leader + prefix + ...
-- - Only really basic stuff should can have a direct keybinding

---------------------
-- Vim standard stuff
--------------------

-- Yanks to the clipboard
map("v", "<leader>y", "\"+y")

-- Moving around
map("n", "-", function() require("mini.files").open(vim.api.nvim_buf_get_name(0), false) end)

-- Diagnostics
map("n", "K", vim.lsp.buf.hover, { silent = true })

-- Completion
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


----------------------------
-- W Is for [W]indows
--
-- The nvim kind, not the OS
----------------------------
map("n", "<leader>wh", "<C-w>h")
map("n", "<leader>wj", "<C-w>j")
map("n", "<leader>wk", "<C-w>k")
map("n", "<leader>wl", "<C-w>l")
map("n", "<leader>wH", "<C-w>H")
map("n", "<leader>wJ", "<C-w>J")
map("n", "<leader>wK", "<C-w>K")
map("n", "<leader>wL", "<C-w>L")

-- Tool windows
map("n", "<leader>wu", function() vim.cmd("UndotreeToggle") end, { silent = true })
map("n", "<leader>wt", function() require("neotest").summary.open() end)

------------------
-- G Is for [G]oto
------------------

-- Goto
map("n", "g]", function() vim.cmd("cnext") end)
map("n", "g[", function() vim.cmd("cprev") end)
map("n", "gd", function() require("mini.extra").pickers.lsp({ scope = "definition" }) end, { silent = true })
map("n", "gr", function() require("mini.extra").pickers.lsp({ scope = "references" }) end, { silent = true })
map("n", "gu", function() vim.cmd("UndotreeToggle") end, { silent = true })

---------------------------
-- F Is for [F]inding stuff
---------------------------

map("n", "<leader>ff", function() require("mini.pick").builtin.files({ tool = "git" }) end)
map("n", "<leader>fs", function() require("mini.pick").builtin.grep_live({ tool = "git" }) end)
map("n", "<leader>fh", function() require("mini.pick").builtin.help() end)
map("n", "<leader>fb", function() require("util.pickers").relativeBufferPicker() end)
map("n", "<leader>fk", function() require("mini.extra").pickers.commands() end)
map("n", "<leader>fm", function() require("mini.extra").pickers.marks() end)

--------------------------
-- C Is for [C]ode actions
--------------------------

map("n", "<leader>cr", vim.lsp.buf.rename)
map("n", "<leader>ca", function()
    vim.lsp.buf.code_action()
    -- require("util.pickers").codeActionsPicker()
end)

-----------------------
-- D is for [D]ebugging
-----------------------

map("n", "<leader>dc", function() require("dap").continue() end, { silent = true })
map("n", "<leader>dn", function() require("dap").step_over() end, { silent = true })
map("n", "<leader>d[", function() require("dap").step_into() end, { silent = true })
map("n", "<leader>d]", function() require("dap").step_out() end, { silent = true })
map("n", "<leader>dt", function() require("dap").toggle_breakpoint() end, { silent = true })
map("n", "<leader>db", function()
    require("dap").list_breakpoints();
    vim.cmd("copen")
end, { silent = true })
