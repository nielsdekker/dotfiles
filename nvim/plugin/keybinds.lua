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
    require("mini.files").open(vim.api.nvim_buf_get_name(0), false)
end)

-- Map tab to move the completion forward and shift tab to move it backwards
map("i", "<Tab>",
    function() return vim.fn.pumvisible() == 1 and "<C-n>" or "<Tab>" end,
    { silent = true, expr = true }
)
map("i", "<S-Tab>",
    function() return vim.fn.pumvisible() == 1 and "<C-p>" or "<S-Tab>" end,
    { silent = true, expr = true }
)

-- Use // to reset the highlight and search
map("n", "//", function()
    vim.cmd("let @/ = \"\"")
end)

-- Small helpers to make navigating the quick-fix faster
map("n", "<C-j>", function()
    if require("mini.pick").is_picker_active() == false then
        vim.cmd("cnext")
    end
end)
map("n", "<C-k>", function()
    if require("mini.pick").is_picker_active() == false then
        vim.cmd("cprev")
    end
end)

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
map("n", "<leader>wu", function() vim.cmd("UndotreeToggle") end, { silent = true })
map("n", "<leader>wb", function()
    require("dap").list_breakpoints();
    vim.cmd("copen")
end, { silent = true })
map("n", "<leader>wd", function() require("dap-view").toggle() end)
map("n", "<leader>wq", function() require("quicker").toggle() end)

------------------
-- G Is for [G]oto
------------------

-- Goto
map("n", "gd", function() require("mini.extra").pickers.lsp({ scope = "definition" }) end, { silent = true })
map("n", "gr", function() require("mini.extra").pickers.lsp({ scope = "references" }) end, { silent = true })

---------------------------
-- F Is for [F]inding stuff
---------------------------

map("n", "<leader>ff", function() require("mini.pick").builtin.files({ tool = "git" }) end)
map("n", "<leader>fs", function() require("mini.pick").builtin.grep_live({ tool = "git" }) end)
map("n", "<leader>fh", function() require("mini.pick").builtin.help() end)
map("n", "<leader>fb", function() require("pickers").relativeBufferPicker() end)
map("n", "<leader>fk", function() require("mini.extra").pickers.commands() end)
map("n", "<leader>fm", function() require("mini.extra").pickers.marks() end)
map("n", "<leader>fd", function() require("mini.extra").pickers.diagnostic() end)

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

-------------------------
----- Q if for [Q]uickfix
-------------------------

map("n", "<leader>qe", function()
    require("quicker").toggle_expand({
        before = 3,
        after = 3,
        add_to_existing = true,
    })
end)
