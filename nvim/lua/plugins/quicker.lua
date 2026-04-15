vim.pack.add({
    { src = "https://github.com/stevearc/quicker.nvim" },
})

local q = require("quicker")
local default_opts = { before = 3, after = 3 }

q.setup({
    keys = {
        -- Follow fold syntax, assume each quickfix item is a fold
        { "zo", function() q.expand(default_opts) end,        desc = "Expand quickfix items" },
        { "zc", function() q.collapse(default_opts) end,      desc = "Collapse quickfix items" },
        { "za", function() q.toggle_expand(default_opts) end, desc = "Toggle quickfix items" }
    },
    follow = { enabled = true }
})
