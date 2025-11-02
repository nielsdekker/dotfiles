local map = vim.keymap.set

vim.g.mapleader = " "

-- Some guidelines about the keybindings:
-- - Most keybindings are in the format: leader + prefix + ...
-- - Only really basic stuff, or stuff that gets used a lot should can have a
--   direct keybinding.

------------------
-- Quick commmands
------------------

-- Yanks to the system clipboard
map("v", "<leader>y", "\"+y")

-- Open mini files window
map("n", "-", function()
    require("oil").open()
end)

-- Use // to reset the highlight and search
map("n", "//", function()
    vim.cmd("let @/ = \"\"")
end)

-- Remap the spell suggest to snacks
map("n", "z=", function() require("snacks").picker.spelling() end)

-- Goto
map("n", "gd", function() require("snacks").picker.lsp_definitions() end, { silent = true })
map("n", "gr", function() require("snacks").picker.lsp_references() end, { silent = true })

---------------------
-- W is for [W]indows
--
-- The nvim kind, not the OS
---------------------

map("n", "<leader>wh", "<C-w>h")
map("n", "<leader>wj", "<C-w>j")
map("n", "<leader>wk", "<C-w>k")
map("n", "<leader>wl", "<C-w>l")
map("n", "<leader>wH", "<C-w>H")
map("n", "<leader>wJ", "<C-w>J")
map("n", "<leader>wK", "<C-w>K")
map("n", "<leader>wL", "<C-w>L")
map("n", "<leader>w=", "<C-w>=")

-- Tool windows
map("n", "<leader>wd", function() require("dap-view").toggle() end)

-----------------
-- G Is for [G]it
-----------------

map("n", "<leader>gs", function() require("neogit").open() end)

---------------------------
-- F Is for [F]inding stuff
---------------------------

map("n", "<leader>ff", function() require("snacks").picker.files() end)
map("n", "<leader>fs", function() require("snacks").picker.grep() end)
map("n", "<leader>fh", function() require("snacks").picker.help() end)
map("n", "<leader>fb", function() require("snacks").picker.buffers() end)
map("n", "<leader>fk", function() require("snacks").picker.commands() end)
map("n", "<leader>fd", function() require("snacks").picker.diagnostics() end)

--------------------------
-- C Is for [C]ode actions
--------------------------

map("n", "<leader>cr", vim.lsp.buf.rename)
map("n", "<leader>ca", vim.lsp.buf.code_action)

-----------------------
-- D is for [D]ebugging
-----------------------

map("n", "<leader>dc", function() require("dap").continue() end, { silent = true })          -- debug continue
map("n", "<leader>dj", function() require("dap").step_over() end, { silent = true })         -- debug over
map("n", "<leader>dl", function() require("dap").step_into() end, { silent = true })         -- debug into
map("n", "<leader>dh", function() require("dap").step_out() end, { silent = true })          -- debug exit
map("n", "<leader>dt", function() require("dap").toggle_breakpoint() end, { silent = true }) -- debug toggle
